//
//  AuthModel.swift
//  Created on 11/09/20
//  Created for Bridge - Adopt Your Village
//

import Foundation
import Combine

final class AuthModel: ObservableObject {
    @Published var isLogged: Bool?
    private var cancellable: AnyCancellable?

    init() {
        //observe login state
        cancellable = UserDefaults.standard
            .publisher(for: \.isLoggedIn)
            .sink {
                self.isLogged = $0
        }
    }
}
