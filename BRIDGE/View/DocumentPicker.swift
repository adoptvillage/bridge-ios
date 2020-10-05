//
//  DocumentPicker.swift
//  Created on 05/10/20
//  Created for Bridge - Adopt Your Village
//

import Foundation
import SwiftUI
import MobileCoreServices
import FirebaseStorage
import FirebaseAuth

struct DocumentPicker: UIViewControllerRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return DocumentPicker.Coordinator(parent1: self)
    }
    
    @Binding var alert: Bool
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<DocumentPicker>) -> UIDocumentPickerViewController {
        
        let picker = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF)], in: .open)
        picker.allowsMultipleSelection = false
        picker.delegate = context.coordinator
        return picker
        
    }
    
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: UIViewControllerRepresentableContext<DocumentPicker>) {
        
    }
    
    class Coordinator: NSObject, UIDocumentPickerDelegate {
        
        var parent: DocumentPicker
        
        init(parent1: DocumentPicker) {
            parent = parent1
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            print(urls)
            let storageRef = Storage.storage().reference()

//            let uploadTask = bucket.child((urls.first?.deletingPathExtension().lastPathComponent)!).putFile(from: urls.first!, metadata: nil) { (metadata, error) in
//                guard let metadata = metadata else {
//                // Uh-oh, an error occurred!
//                    print(error?.localizedDescription)
//                return
//              }
//              // Metadata contains file metadata such as size, content-type.
//              let size = metadata.size
//              // You can also access to download URL after upload.
//                bucket.downloadURL { (url, error) in
//                guard let downloadURL = url else {
//                  // Uh-oh, an error occurred!
//                  return
//                }
//                    print(downloadURL)
//              }
//            }
            let localFile = urls.first!
            let fileName = urls.first!.deletingPathExtension().lastPathComponent
            let user = Auth.auth().currentUser
            if let userId = user?.uid {
                let path = userId + "/docs/" + fileName
                let reference = storageRef.child(path)

                // Upload the file to the path "images/rivers.jpg"
                let uploadTask = reference.putFile(from: localFile, metadata: nil) { metadata, error in
                  guard let metadata = metadata else {
                    // Uh-oh, an error occurred!
                    print(error?.localizedDescription)
                    return
                  }
                  // Metadata contains file metadata such as size, content-type.
                  let size = metadata.size
                    if size > 5000000 {
                        print("FileSize is big")
                    }
                  // You can also access to download URL after upload.
                    reference.downloadURL { (url, error) in
                    guard let downloadURL = url else {
                      // Uh-oh, an error occurred!
                      return
                    }
                  }
                }
            }
            
            
            // Create a reference to the file you want to upload
            
            
        }
    }
}
