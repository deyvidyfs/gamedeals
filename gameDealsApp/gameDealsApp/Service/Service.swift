//
//  DealService.swift
//  gameDealsApp
//
//  Created by Deyvidy Luã F.S on 17/06/21.
//

import Foundation

typealias NetworkResponse = (Data?, Error?)

class Service {
    static func request(url: URL, httpMethod: String, jsonData: Data, completion: @escaping(NetworkResponse) -> ()) {
        let session = URLSession.shared
        var request = URLRequest(url: url)
        
        request.httpMethod = httpMethod
        request.httpBody = jsonData
        
        session.dataTask(with: request) { data, response, error in
            completion((data, error))
        }.resume()
    }
}
