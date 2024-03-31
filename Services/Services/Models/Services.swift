//
//  Services.swift
//  Services
//
//  Created by Кирилл Давыденков on 30.03.2024.
//

import Foundation

struct Services: Codable {
    let name: String
    let description: String
    let link: URL
    let iconURL: URL

    enum CodingKeys: String, CodingKey {
        case name
        case description
        case link
        case iconURL = "icon_url"
    }
}

struct ServicesResponse: Codable {
    let body: ServicesBody
    let status: Int
}

struct ServicesBody: Codable {
    let services: [Services]
}
