//
//  HomeViewController.swift
//  delivery_app
//
//  Created by Алексей Щукин on 30.06.2023.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController{
    
    let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        collectionViewConstraints()
        delegates()
        getCollectionViewCellData()
        customNavBar()
        
    }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .white
        return cv
    }()
    
}

extension HomeViewController{
    
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

extension HomeViewController{
    
    func collectionViewConstraints(){
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
    }
    
}

extension HomeViewController{
    
    func getCollectionViewCellData(){
        viewModel.getCategories {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
    }
    
}

extension HomeViewController{
    
    func delegates(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categories.сategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        cell.custom(url: viewModel.categories.сategories[indexPath.item].imageURL,title: viewModel.categories.сategories[indexPath.item].name)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width-20, height: collectionView.frame.width/2.4)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CategoryViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
