//
//  Basket.swift
//  delivery_app
//
//  Created by Алексей Щукин on 04.07.2023.
//

import Foundation

class Basket{
    var dishes = [BasketDishes]()
    static let sharedInstance = Basket()
    var allPrice = 0
}
