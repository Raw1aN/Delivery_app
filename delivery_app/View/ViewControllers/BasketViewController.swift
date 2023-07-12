//
//  BasketViewController.swift
//  delivery_app
//
//  Created by Алексей Щукин on 03.07.2023.
//

import UIKit

class BasketViewController: UIViewController, CustomCellUpdater {
    
    
    
    let viewModel = BasketViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        customNavBar()
        payButtonConstraints()
        collectionViewConstraints()
        delegates()
        getDishes()
    }
    
    
    let payButton: UIButton = {
        let button = UIButton()
        button.setTitle("Оплатить", for: .normal)
        button.backgroundColor = UIColor(named: "blue")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return button
    }()
    

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(BasketCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .white
        return cv
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        getDishes()
    }
    
}


extension BasketViewController{
    
    func customNavBar(){
        let navBarView = NavigationBarView(title: viewModel.getDate())
        viewModel.getLocation { city in
            navBarView.locationView.updateLocation(city: city)
        }
        var image = UIImage(named: "AccountPicture")
        image = image?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navBarView)
        viewModel.getLocation { city in
            navBarView.locationView.updateLocation(city: city)
        }
    }
    
}

extension BasketViewController{
    
    func collectionViewConstraints(){
        
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: payButton.topAnchor, constant: -10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    }
    
    func payButtonConstraints(){
        view.addSubview(payButton)
        payButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        payButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        payButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        payButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
}

extension BasketViewController{
    
    func getDishes(){
        viewModel.getDishes {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.reloadAllPrice()
            }
        }
    }
    
}


extension BasketViewController{
    
    func delegates(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func updateCollectionView() {
        viewModel.getDishes {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.reloadAllPrice()
            }
        }
    }
    
}

extension BasketViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.dishes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BasketCollectionViewCell
        cell.custom(url: viewModel.dishes[indexPath.item].imageURL, name: viewModel.dishes[indexPath.item].name, price: viewModel.dishes[indexPath.item].price, weight: viewModel.dishes[indexPath.item].weight,count: viewModel.dishes[indexPath.item].count)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width/6)
    }
    
}

extension BasketViewController{
    
    func reloadAllPrice(){
        payButton.setTitle(String("Оплатить \(Basket.sharedInstance.allPrice) ₽"), for: .normal)
    }
    
}
