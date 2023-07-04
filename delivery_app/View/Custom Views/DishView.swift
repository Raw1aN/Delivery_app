//
//  DishView.swift
//  delivery_app
//
//  Created by Алексей Щукин on 03.07.2023.
//

import UIKit

class DishView: UIView {

    func configure(){
        
    }

    init(){
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

}

extension DishView{
    
    func initialize(){
        layer.cornerRadius = 10
        backgroundColor = UIColor(named: "dishBackground")
        addSubview(image)
        image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        image.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        image.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
    }
    
    func custom(url: String){
        image.load(url: (URL(string: url) ?? URL(string: ""))!)
    }
    
}
