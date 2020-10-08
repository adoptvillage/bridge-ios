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
    
    @Binding var uploadItemUrls: [URL]
    @Binding var selectedButton: Int
    @Binding var addedAllFiles: Bool
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<DocumentPicker>) -> UIDocumentPickerViewController {
        
        let picker = UIDocumentPickerViewController(documentTypes: [String(kUTTypeJPEG), String(kUTTypePDF)], in: .open)
        picker.allowsMultipleSelection = false
        picker.delegate = context.coordinator
        return picker
        
    }
    
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: UIViewControllerRepresentableContext<DocumentPicker>) {
        
    }
    
    class Coordinator: NSObject, UIDocumentPickerDelegate {
        
        var parent: DocumentPicker
        private var documentUploadViewModel = DocumentUploadViewModel()
        
        init(parent1: DocumentPicker) {
            parent = parent1
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            if self.parent.uploadItemUrls.count == 3 {
                if self.parent.selectedButton == 1 {
                    self.parent.uploadItemUrls[0] = urls.first!
                }
                if self.parent.selectedButton == 2 {
                    self.parent.uploadItemUrls[1] = urls.first!
                    
                }
                if self.parent.selectedButton == 3 {
                    self.parent.uploadItemUrls[2] = urls.first!
                    self.parent.selectedButton = -1
                }
            }else {
                if !self.parent.uploadItemUrls.contains(urls.first!) {
                    self.parent.uploadItemUrls.append(urls.first!)
                }
                
            }
            if self.parent.uploadItemUrls.count == 3 {
                self.parent.addedAllFiles = true
            }
        }
        
        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            self.parent.selectedButton = self.parent.selectedButton == 1 ? 0 : self.parent.selectedButton == 2 ? 1 : self.parent.selectedButton == 3 ? 2 : 0
        }
        
        
        
    }
}

