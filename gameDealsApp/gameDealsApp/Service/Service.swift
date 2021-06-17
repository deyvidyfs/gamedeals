//
//  DealService.swift
//  gameDealsApp
//
//  Created by Deyvidy Luã F.S on 17/06/21.
//

import Foundation

typealias NetworkResponse = (Data?, Error?)

class Service {
    static func request(url: URL, completion: @escaping(NetworkResponse) -> ()) {
        let session = URLSession.shared
        let request = URLRequest(url: url)
        
        session.dataTask(with: request) { data, response, error in
            completion((data, error))
        }.resume()
    }
}
