//
//  URLConstants.swift
//  Created on 10/09/20
//  Created for Bridge - Adopt Your Village
//

import Foundation

let baseUrl: String = "http://bridge-temp.herokuapp.com/"
//let baseUrl: String = "http://127.0.0.1:5000/"

struct URLStringConstants {
    struct User {
        static let login: String = baseUrl + "user/login"
        static let register: String = baseUrl + "user/register"
        static let profile: String = baseUrl + "user/profile"
        static let dashboard: String = baseUrl + "user/dashboard"
        static let history: String = baseUrl + "user/history"
        static let preferredLocation: String = baseUrl + "user/preferredlocation"
    }
    struct Application {
        static let submit: String = baseUrl + "application/submit"
        static let fetch: String = baseUrl + "application"
        static let filterApplication: String = baseUrl + "application/filter"
        static let accept: String = baseUrl + "application/accept"
    }
}
