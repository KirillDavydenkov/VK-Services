//
//  NetworkRequest.swift
//  Services
//
//  Created by Кирилл Давыденков on 30.03.2024.
//

import Foundation

class NetworkRequest {
    
    static let shared = NetworkRequest()
    
    private init() {}
    
    func getData(completionHandler: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.request(.services) { data, _, error in
            DispatchQueue.global().async {
                if error != nil {
                    completionHandler(.failure(.urlError))
                } else {
                    guard let data else { return }
                    completionHandler(.success(data))
                }
            }
        }
    }
}
