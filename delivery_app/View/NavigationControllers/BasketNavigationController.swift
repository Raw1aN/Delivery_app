//
//  BasketViewController.swift
//  delivery_app
//
//  Created by Алексей Щукин on 29.06.2023.
//

import UIKit

class BasketNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        customNavBar()
        navigationBar.shadowImage = UIImage()
        navigationBar.backgroundColor = .white
        navigationBar.barTintColor = .white
    }

}


extension BasketNavigationController{
    
    func customNavBar(){
        navigationBar.tintColor = .black
    }
    
}
