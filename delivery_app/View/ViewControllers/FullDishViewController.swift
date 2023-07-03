//
//  FullDishViewController.swift
//  delivery_app
//
//  Created by Алексей Щукин on 03.07.2023.
//

import UIKit

class FullDishViewController: UIViewController {
    
    private let fullDishView = FullDishView()

    init(name: String, price: Int, weight: Int, description: String,url: String) {
        super.init(nibName: nil, bundle: nil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
        fullDishView.dismissButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        fullDishView.priceLabel.text = "\(String(price)) ₽ "
        fullDishView.nameLabel.text = name
        fullDishView.weightLabel.text = "· \(String(weight))г"
        fullDishView.descriptionLabel.text = description
        fullDishView.image.load(url: (URL(string: url) ?? URL(string: ""))!)
        view = fullDishView
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    @objc func dismissView(){
        self.dismiss(animated: true, completion: nil)
    }

}
