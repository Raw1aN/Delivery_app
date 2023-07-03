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
        
        //custom()
        //addButton()
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
    
//    func custom(){
//        let stackView = UIStackView(arrangedSubviews: [AccountCirclImage()])
//        stackView.spacing = 5
//        stackView.alignment = .center
//        navigationBar.addSubview(AccountCirclImage())
//        self.modalPresentationStyle = .fullScreen
//    }
//
//    func addButton(){
//        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
//        button.backgroundColor = .black
//        button.setTitle("Test Button", for: .normal)
//        button.addTarget(self, action: #selector(taped), for: .touchUpInside)
//        view.addSubview(button)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
//        button.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 0).isActive = true
//    }
//
//    @objc func taped(){
//        self.present(SearchViewController(), animated: true)
//    }
    
}

extension HomeNavigationController: UINavigationControllerDelegate{
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        let item = UIBarButtonItem(title: "", image: UIImage(named: "BackButton"), target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem = item
        
    }
    
}
