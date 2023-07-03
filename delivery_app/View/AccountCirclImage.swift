//
//  AccountCirclImage.swift
//  delivery_app
//
//  Created by Алексей Щукин on 30.06.2023.
//

import UIKit

class AccountCirclImage: UIView {
    
    func configure(){
        
    }

    init(){
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AccountCirclImage{
    
    func initialize(){
        let image = UIImageView(image: UIImage(named: "AccountPicture"))
        addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
    }
    
}
