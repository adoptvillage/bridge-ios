//
//  LocatinDataService.swift  
//  Created on 26/09/20
//  Created for Bridge - Adopt Your Village
//

import Foundation

struct LocatinDataService {
    
    //MARK: Generic function to fetch data from JSON file
    static func getData<T: Decodable>(file: String, completion: @escaping (T) -> ()) {
        
        //Read json file from project folder
        
        guard let bundlePath = Bundle.main.path(forResource: file, ofType: "json") else { return }
        
        
        //Get data from JSON file
        guard let data = try? String(contentsOfFile: bundlePath).data(using: .utf8) else { return }
        
        do {
            //Decode JSON objects from file as a Generic type (T)
            
            let obj = try JSONDecoder().decode(T.self, from: data)
            completion(obj)
        } catch let jsonError {
            print("Failed to decode json: ", jsonError)
            return
        }
    }
    
    
    
    
}
