//
//  HomeViewController.swift
//  delivery_app
//
//  Created by Алексей Щукин on 29.06.2023.
//

import UIKit

class HomeNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        customNavBar()
        navigationBar.shadowImage = UIImage()
        navigationBar.backgroundColor = .white
        navigationBar.barTintColor = .white
        self.delegate = self
        
        
    }

}

extension HomeNavigationController{
    
    func customNavBar(){
        navigationBar.tintColor = .black
    }
    
}

extension HomeNavigationController: UINavigationControllerDelegate{
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        let item = UIBarButtonItem(title: "", image: UIImage(named: "BackButton"), target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem = item
        
    }
    
}
