//
//  FullDishViewController.swift
//  delivery_app
//
//  Created by Алексей Щукин on 03.07.2023.
//

import UIKit

class FullDishViewController: UIViewController {
    
    private let fullDishView = FullDishView()
    var dish: BasketDishes?

    init(name: String, price: Int, weight: Int, description: String,url: String) {
        super.init(nibName: nil, bundle: nil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
        fullDishView.dismissButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        fullDishView.addButton.addTarget(self, action: #selector(addDish), for: .touchUpInside)
        fullDishView.priceLabel.text = "\(String(price)) ₽ "
        fullDishView.nameLabel.text = name
        fullDishView.weightLabel.text = "· \(String(weight))г"
        fullDishView.descriptionLabel.text = description
        fullDishView.image.load(url: (URL(string: url) ?? URL(string: ""))!)
        self.dish = BasketDishes(name: name, price: price, weight: weight, imageURL: url,count: 1)
        view = fullDishView
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    @objc func dismissView(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func addDish(){
        print("Dish added")
        self.dismiss(animated: true, completion: nil)
        guard let dishResult = self.dish else { return }
        for dish in Basket.sharedInstance.dishes{
            if dish.name == dishResult.name{
                return
            }
        }
        Basket.sharedInstance.dishes.append(dishResult)
        Basket.sharedInstance.allPrice += dishResult.price
    }

}


