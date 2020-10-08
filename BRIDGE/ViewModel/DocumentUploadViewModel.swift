//
//  DocumentUploadViewModel.swift
//  Created on 06/10/20
//  Created for Bridge - Adopt Your Village
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseStorage

class DocumentUploadViewModel: ObservableObject {
    @Published var progress: Double = 0
    @Published var doneUpload: Bool = false
    @Published var fileUrls: [String] = []
    @Published var docModel = DocumentFile(offerLetter: "", feeStructure: "", bankStatement: "")
    @Published var alertMessage = ""
    @Published var showAlert = false
    
    func uplooadDoc(documentsUrl: [URL], completion: @escaping (StorageReference?, String?) -> Void) {
        if documentsUrl.count < 3 {
            completion(nil, "Please select all mentioned documents")
            return
        }
        if (documentsUrl.count != Set(documentsUrl).count) {
            completion(nil, "Do not select duplicate document")
            return
        }
        for url in documentsUrl {
            if url.fileSize() > 5 {
                completion(nil, "Some of the files are greater than 5 MB")
                return
            }
        }
        let user = Auth.auth().currentUser
        if let userId = user?.uid {
            for url in documentsUrl {
                let storageRef = Storage.storage().reference()
                let localFile = url
                let fileName = url == documentsUrl[0] ? "offer_letter" : url == documentsUrl[1] ? "fee_structure" : "bank_statement"
//                let fileName = url.deletingPathExtension().lastPathComponent
                let path = userId + "/docs/" + fileName
                let reference = storageRef.child(path)
                print(type(of: reference))
                
                // Upload the file to the path "images/rivers.jpg"
                let uploadTask = reference.putFile(from: localFile, metadata: nil) { metadata, error in
                    // You can also access to download URL after upload.
                    if error != nil {
                        completion(nil, error?.localizedDescription)
                    }
                    completion(reference, nil)
                }
                
                uploadTask.observe(.progress) { snapshot in
                    if self.progress <= 300 {
                        let percentComplete = Int64(100.0) * (snapshot.progress!.completedUnitCount) / (snapshot.progress!.totalUnitCount)
                        self.progress += Double(percentComplete)
                    }
                    
                }
                
            }

            
            
        }
        
    }
    
    func getDocumentDetails(uploadedItemsUrls: [URL]) {
        uplooadDoc(documentsUrl: uploadedItemsUrls) { (reference, error) in
            if error != nil {
                self.alertMessage = error ?? ""
                self.progress = 0
                self.doneUpload = false
                self.showAlert.toggle()
            }
            if let reference = reference {
                reference.downloadURL { (url, error) in
                    
                    guard let downloadURL = url else {
                        // Uh-oh, an error occurred!
                        print(error?.localizedDescription)
                        return
                    }
                    print(downloadURL)
                    if reference.name == "offer_letter" {
                        self.docModel.offerLetter = downloadURL.absoluteString
                    } else if reference.name == "fee_structure" {
                        self.docModel.feeStructure = downloadURL.absoluteString
                    } else if reference.name == "bank_statement" {
                        self.docModel.bankStatement = downloadURL.absoluteString
                    }
                }
                self.doneUpload = true
            }
            
            
        }
    }
    
}

