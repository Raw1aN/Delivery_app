//
//  TabBarController.swift
//  delivery_app
//
//  Created by Алексей Щукин on 29.06.2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarConfiguration()
        tabBarCustomization()
    }

}

extension TabBarController{
    
    private func tabBarConfiguration(){
        viewControllers = [generateVC(viewController: HomeNavigationController(rootViewController: HomeViewController()), title: "Главная", image: UIImage(named: "Main")),generateVC(viewController: SearchNavigationController(rootViewController: SearchViewController()), title: "Поиск", image: UIImage(named: "Search")),generateVC(viewController: BasketNavigationController(rootViewController: BasketViewController()), title: "Корзина", image: UIImage(named: "Basket")),generateVC(viewController: AccountNavigationController(rootViewController: AccountViewController()), title: "Аккаунт", image: UIImage(named: "Account"))]
        tabBar.barTintColor = .white
        tabBar.tintColor = UIColor(named: "blue")
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController{
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func tabBarCustomization(){
        tabBar.items?.first?.titlePositionAdjustment = UIOffset(horizontal: 21.5, vertical: 0.0)
        tabBar.items?.last?.titlePositionAdjustment = UIOffset(horizontal: -21.5, vertical: 0.0)
        tabBar.items?[1].titlePositionAdjustment = UIOffset(horizontal: 8, vertical: 0.0)
        tabBar.items?[2].titlePositionAdjustment = UIOffset(horizontal: -8, vertical: 0.0)
    }
    
}
