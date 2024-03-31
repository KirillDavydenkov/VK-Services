//
//  EndPoint.swift
//  Services
//
//  Created by Кирилл Давыденков on 30.03.2024.
//

import Foundation

struct EndPoint {
    var path: String
}

extension EndPoint {
    var url: URL {
        guard let url = URL(string: "https://publicstorage.hb.bizmrg.com/sirius/result.json") else {
            preconditionFailure("Invalid URL \(self.url)")
        }
        return url
    }
}

extension EndPoint {
    static var services: Self {
        EndPoint(path: "services")
    }
}
