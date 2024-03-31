//
//  NetworkDataFetch.swift
//  Services
//
//  Created by Кирилл Давыденков on 30.03.2024.
//

import Foundation

class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    
    private init() {}
    
    func fetchServices(response: @escaping ([Services]?, NetworkError?) -> Void) {
        NetworkRequest.shared.getData { result in
            switch result {
            case .success(let data):
                do {
                    let servicesResponse = try JSONDecoder().decode(ServicesResponse.self, from: data)
                    response(servicesResponse.body.services, nil)
                } catch {
                    print("Ошибка при декодировании JSON", error)
                    response(nil, .canNotParseData)
                }
            case .failure(_):
                response(nil, .canNotParseData)
            }
        }
    }
}
