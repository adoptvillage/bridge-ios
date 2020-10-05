//
//  DocumentPicker.swift
//  Created on 05/10/20
//  Created for Bridge - Adopt Your Village
//

import Foundation
import SwiftUI
import MobileCoreServices
import Firebase

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
//            let bucket = Storage.storage()
        }
    }
}
