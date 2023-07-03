//
//  BackButtonView.swift
//  delivery_app
//
//  Created by Алексей Щукин on 02.07.2023.
//

import Foundation
import UIKit

class BackButtonView: UIView{
    
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

extension BackButtonView{
    
    func initialize(){
        let image = UIImageView(image: UIImage(named: "BackButton"))
        addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: topAnchor, constant: -7).isActive = true
        image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    }
    
}
