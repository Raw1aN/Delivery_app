//
//  FullDishView.swift
//  delivery_app
//
//  Created by Алексей Щукин on 03.07.2023.
//

import UIKit

class FullDishView: UIView {
    

    func configure(){
        
    }

    init(){
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let customView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        return view
    }()
    
    let dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "dismiss"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        return button
    }()
    
    let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "like"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        return button
    }()
    
    let underImageView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "dishBackground")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Рыба с овощами и рисом"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "799 ₽ "
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .black
        return label
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "· 560г"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .gray
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Рыба маринованная со специями, лимонным соком, соевым соусом и запечeнная в духовке с лучком, томатами и картошечкой под золотистой майонезно-сырной шубкой"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить в корзину", for: .normal)
        button.backgroundColor = UIColor(named: "blue")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return button
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

}

extension FullDishView{
    
    func initialize(){
        backgroundColor = UIColor.black.withAlphaComponent(0.4)
        addSubview(customView)
        
        customView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        customView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        addSubview(underImageView)
        underImageView.topAnchor.constraint(equalTo: customView.topAnchor, constant: 15).isActive = true
        underImageView.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -15).isActive = true
        underImageView.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 15).isActive = true
        underImageView.heightAnchor.constraint(equalToConstant: 230).isActive = true
        addSubview(image)
        image.topAnchor.constraint(equalTo: underImageView.topAnchor, constant: 20).isActive = true
        image.bottomAnchor.constraint(equalTo: underImageView.bottomAnchor, constant: -15).isActive = true
        image.widthAnchor.constraint(equalTo: image.heightAnchor, multiplier: 0.8).isActive = true
        image.centerXAnchor.constraint(equalTo: underImageView.centerXAnchor, constant: 0).isActive = true
//        image.leadingAnchor.constraint(equalTo: underImageView.leadingAnchor, constant: 56).isActive = true
//        image.trailingAnchor.constraint(equalTo: underImageView.trailingAnchor, constant: -56).isActive = true
        addSubview(dismissButton)
        dismissButton.topAnchor.constraint(equalTo: customView.topAnchor, constant: 24).isActive = true
        dismissButton.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -24).isActive = true
        dismissButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        dismissButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        addSubview(likeButton)
        likeButton.topAnchor.constraint(equalTo: customView.topAnchor, constant: 24).isActive = true
        likeButton.trailingAnchor.constraint(equalTo: dismissButton.leadingAnchor, constant: -8).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: underImageView.bottomAnchor, constant: 8).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 15).isActive = true
        addSubview(priceLabel)
        priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 15).isActive = true
        addSubview(weightLabel)
        weightLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 0).isActive = true
        weightLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6).isActive = true
        addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 6).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 15).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: underImageView.widthAnchor, multiplier: 1).isActive = true
        addSubview(addButton)
        addButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 15).isActive = true
        addButton.leadingAnchor.constraint(equalTo: underImageView.leadingAnchor, constant: 0).isActive = true
        addButton.trailingAnchor.constraint(equalTo: underImageView.trailingAnchor, constant: 0).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
//        customView.topAnchor.constraint(equalTo: topAnchor, constant: 190).isActive = true
        customView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        customView.bottomAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 16).isActive = true
    }
    
}

protocol FullDishViewDeleagate: AnyObject {
    func getDataToCategoryViewController(_ view: FullDishView)
}
