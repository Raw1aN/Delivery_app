//
//  CollectionViewCell.swift
//  delivery_app
//
//  Created by Алексей Щукин on 03.07.2023.
//

import UIKit

class BasketCollectionViewCell: UICollectionViewCell {
    
    private var dish: BasketDishes?
    weak var delegate: CustomCellUpdater?
    
    func yourFunctionWhichDoesNotHaveASender () {
        delegate?.updateCollectionView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backgrountImageView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "dishBackground")
        view.layer.cornerRadius = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Зеленый салат"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "390 ₽ "
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.text = "· 420г"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()
    
    let countLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    let minusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Minus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Plus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let settingsView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "dishBackground")
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    func custom(url: String, name: String, price: Int, weight: Int, count: Int){
        image.load(url: (URL(string: url) ?? URL(string: ""))!)
        nameLabel.text = name
        priceLabel.text = String("\(price) ₽ ")
        weightLabel.text = String("· \(weight)г")
        countLabel.text = String(count)
        self.dish = BasketDishes(name: name, price: price, weight: weight, imageURL: url, count: count)
    }
}

extension BasketCollectionViewCell{
    
    func constraints(){
        plusButton.addTarget(self, action: #selector(plusDish), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minusDish), for: .touchUpInside)
        contentView.addSubview(backgrountImageView)
        backgrountImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        backgrountImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        backgrountImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        backgrountImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        let priceWeightStackView = UIStackView(arrangedSubviews: [priceLabel,weightLabel])
        priceWeightStackView.axis = .horizontal
        let infostackView = UIStackView(arrangedSubviews: [nameLabel,priceWeightStackView])
        infostackView.spacing = 4
        infostackView.alignment = .leading
        infostackView.axis = .vertical
        contentView.addSubview(infostackView)
        infostackView.translatesAutoresizingMaskIntoConstraints = false
        infostackView.leadingAnchor.constraint(equalTo: backgrountImageView.trailingAnchor, constant: 8).isActive = true
        infostackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        contentView.addSubview(settingsView)
        settingsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        settingsView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        settingsView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        settingsView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        settingsView.addSubview(countLabel)
        countLabel.centerYAnchor.constraint(equalTo: settingsView.centerYAnchor, constant: 0).isActive = true
        countLabel.centerXAnchor.constraint(equalTo: settingsView.centerXAnchor, constant: 0).isActive = true
        settingsView.addSubview(minusButton)
        minusButton.leadingAnchor.constraint(equalTo: settingsView.leadingAnchor, constant: 13).isActive = true
        minusButton.centerYAnchor.constraint(equalTo: settingsView.centerYAnchor, constant: 0).isActive = true
        settingsView.addSubview(plusButton)
        plusButton.trailingAnchor.constraint(equalTo: settingsView.trailingAnchor, constant: -6).isActive = true
        plusButton.centerYAnchor.constraint(equalTo: settingsView.centerYAnchor, constant: 0).isActive = true
        backgrountImageView.addSubview(image)
        image.topAnchor.constraint(equalTo: backgrountImageView.topAnchor, constant: 0).isActive = true
        image.leadingAnchor.constraint(equalTo: backgrountImageView.leadingAnchor, constant: 0).isActive = true
        image.trailingAnchor.constraint(equalTo: backgrountImageView.trailingAnchor, constant: 0).isActive = true
        image.bottomAnchor.constraint(equalTo: backgrountImageView.bottomAnchor, constant: 0).isActive = true
    }
    
}

extension BasketCollectionViewCell{
    
    @objc func plusDish(){
        guard let dishResult = self.dish else { return }
        for i in 0..<Basket.sharedInstance.dishes.count{
            if Basket.sharedInstance.dishes[i].name == dishResult.name{
                let basketDishResult = BasketDishes(name: Basket.sharedInstance.dishes[i].name, price: Basket.sharedInstance.dishes[i].price, weight: Basket.sharedInstance.dishes[i].weight, imageURL: Basket.sharedInstance.dishes[i].imageURL, count: Basket.sharedInstance.dishes[i].count+1)
                Basket.sharedInstance.dishes[i] = basketDishResult
                Basket.sharedInstance.allPrice += Basket.sharedInstance.dishes[i].price
                countLabel.text = String(basketDishResult.count)
            }
        }
        delegate?.reloadAllPrice()
    }
    
    @objc func minusDish(){
        guard let dishResult = self.dish else { return }
        for i in 0..<Basket.sharedInstance.dishes.count{
            if Basket.sharedInstance.dishes.count>i{
                if Basket.sharedInstance.dishes[i].name == dishResult.name{
                    if Basket.sharedInstance.dishes[i].count > 1 {
                        let basketDishResult = BasketDishes(name: Basket.sharedInstance.dishes[i].name, price: Basket.sharedInstance.dishes[i].price, weight: Basket.sharedInstance.dishes[i].weight, imageURL: Basket.sharedInstance.dishes[i].imageURL, count: Basket.sharedInstance.dishes[i].count-1)
                        Basket.sharedInstance.allPrice -= Basket.sharedInstance.dishes[i].price
                        Basket.sharedInstance.dishes[i] = basketDishResult
                        countLabel.text = String(basketDishResult.count)
                        delegate?.reloadAllPrice()
                    }
                    else{
                        Basket.sharedInstance.allPrice -= Basket.sharedInstance.dishes[i].price
                        Basket.sharedInstance.dishes.remove(at: i)
                        delegate?.updateCollectionView()
                        delegate?.reloadAllPrice()
                    }
                }
            }
            else{
                return
            }
        }
        
    }
    
}

protocol CustomCellUpdater: class {
    func updateCollectionView()
    func reloadAllPrice()
}
