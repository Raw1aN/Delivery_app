//
//  HomeCollectionViewCell.swift
//  delivery_app
//
//  Created by Алексей Щукин on 02.07.2023.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let label: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        title.numberOfLines = 0
        return title
    }()
    
    func custom(url: String,title: String){
        image.load(url: (URL(string: url) ?? URL(string: ""))!)
        label.text = title
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeCollectionViewCell{
    
    func constraints(){
        contentView.addSubview(image)
        image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        contentView.addSubview(label)
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        label.widthAnchor.constraint(equalToConstant: 160).isActive = true
    }
    
}
