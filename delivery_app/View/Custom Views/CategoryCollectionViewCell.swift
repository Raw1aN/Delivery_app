//
//  CategoryCollectionViewCell.swift
//  delivery_app
//
//  Created by Алексей Щукин on 03.07.2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    let dishView: DishView = {
        let view = DishView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func custom(url: String,title: String){
        label.text = title
        dishView.custom(url: url)
    }
    
    let label: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        title.numberOfLines = 0
        title.textColor = .black
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CategoryCollectionViewCell{
    
    func constraints(){
        contentView.addSubview(dishView)
        dishView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        dishView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50).isActive = true
        dishView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        dishView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        contentView.addSubview(label)
        label.topAnchor.constraint(equalTo: dishView.bottomAnchor, constant: 5).isActive = true
        label.widthAnchor.constraint(equalTo: dishView.widthAnchor, multiplier: 1).isActive = true
    }
    
}
