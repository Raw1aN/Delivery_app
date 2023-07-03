//
//  NavigationBarView.swift
//  delivery_app
//
//  Created by Алексей Щукин on 01.07.2023.
//

import UIKit

class NavigationBarView: UIView {
    
    func configure(){
        
    }

    init(title: String){
        super.init(frame: .zero)
        initialize()
        getDate(title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let locationView = {
        let view = LocationView()
        return view
    }()

}

extension NavigationBarView {
    
    func initialize(){
        addSubview(locationView)
        
        locationView.translatesAutoresizingMaskIntoConstraints = false
        locationView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        locationView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
    }
    
    func getDate(title: String){
        locationView.getDate(title: title)
    }
    
    func updateLocation(city: String){
        locationView.updateLocation(city: city)
    }
    
}
