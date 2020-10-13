//
//  SearchBar.swift
//  Created on 09/10/20
//  Created for Bridge - Adopt Your Village
//

import Foundation
import Foundation
import SwiftUI
 
 
struct SearchBar: UIViewRepresentable {
    
    @Binding var text: String
    var placeholder : String
    class Coordinator: NSObject,UISearchBarDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchsBar = UISearchBar(frame: .zero)
        searchsBar.delegate = context.coordinator
        searchsBar.placeholder = placeholder
        searchsBar.searchBarStyle = .minimal
        return searchsBar
        
    }
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
    
    
}
