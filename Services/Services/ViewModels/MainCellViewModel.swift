//
//  MainCellViewModel.swift
//  Services
//
//  Created by Кирилл Давыденков on 30.03.2024.
//

import UIKit

class MainCellViewModel {
    let name: String
    let description: String
    let link: URL
    let iconURL: URL?
    
    init(_ service: Services) {
        self.name = service.name
        self.description = service.description
        self.iconURL = service.iconURL
        self.link = service.link
    }
    
    func loadImage(completion: @escaping (UIImage?) -> Void) {
        guard let iconURL = iconURL else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: iconURL) { data, response, error in
            guard let data = data, let image = UIImage(data: data), error == nil else {
                completion(nil)
                return
            }
            completion(image)
        }.resume()
    }
}
