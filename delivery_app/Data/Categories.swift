//
//  Categories.swift
//  delivery_app
//
//  Created by Алексей Щукин on 01.07.2023.
//

import Foundation

// MARK: - Categories
struct Categories: Codable {
    let сategories: [Сategory]
}

// MARK: - Сategory
struct Сategory: Codable {
    let id: Int
    let name: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
    }
}
