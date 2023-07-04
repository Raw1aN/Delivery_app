//
//  DishFilterCollectionViewCell.swift
//  delivery_app
//
//  Created by Алексей Щукин on 03.07.2023.
//

import UIKit

class DishFilterCollectionViewCell: UICollectionViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Все меню"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let customView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 11
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "dishBackground")
        return view
    }()
    
}

extension DishFilterCollectionViewCell{
    
    func constraints(){
        contentView.addSubview(customView)
        
        customView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        customView.addSubview(label)
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
    }
    
}
