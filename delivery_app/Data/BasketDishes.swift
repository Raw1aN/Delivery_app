//
//  BasketDishes.swift
//  delivery_app
//
//  Created by Алексей Щукин on 04.07.2023.
//

import Foundation

struct BasketDishes: Hashable {
    let name: String
    let price, weight: Int
    let imageURL: String
    let count: Int
}
