//
//  CategoryViewController.swift
//  delivery_app
//
//  Created by Алексей Щукин on 02.07.2023.
//

import UIKit

class CategoryViewController: UIViewController {
    
    let viewModel = CategoryViewModel()
    var fullDishViewController: FullDishViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        filterCollectionViewConstraints()
        customNavBar()
        collectionViewConstraints()
        delegates()
        getCategoryCollectionViewCellData()
    }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    private let filterCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
//        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(DishFilterCollectionViewCell.self, forCellWithReuseIdentifier: "filterCell")
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()

}

extension CategoryViewController{
    
    func customNavBar(){
        var image = UIImage(named: "AccountPicture")
        image = image?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: nil, action: nil)
        navigationItem.title = "Азиатская кухня"
        
        let yourBackImage = UIColor.white.image(CGSize(width: 0, height: 0))
        self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
    }
}

extension CategoryViewController{
    
    func getCategoryCollectionViewCellData(){
        
        viewModel.getDishes {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
}

extension CategoryViewController{
    
    func collectionViewConstraints(){
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: filterCollectionView.bottomAnchor, constant: 16).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    }
    
    func filterCollectionViewConstraints(){
        view.addSubview(filterCollectionView)
        filterCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        filterCollectionView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        filterCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        filterCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    }
    
}

extension CategoryViewController{
    
    func delegates(){
        collectionView.delegate = self
        collectionView.dataSource = self
        filterCollectionView.dataSource = self
        filterCollectionView.delegate = self
    }
    
}

extension CategoryViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionView{
            return CGSize(width: collectionView.frame.width/3.2, height: collectionView.frame.width/3.2+50)
        }
        else{
            let item = viewModel.filters[indexPath.row]
            var itemSize = item.size(withAttributes: [
                NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)
            ])
            itemSize.width += 32
            itemSize.height += 20
            return itemSize
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView{
            return viewModel.dishes.dishes.count
        }
        else{
            return viewModel.filters.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryCollectionViewCell
            cell.custom(url: viewModel.dishes.dishes[indexPath.item].imageURL, title: viewModel.dishes.dishes[indexPath.item].name)
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCell", for: indexPath) as! DishFilterCollectionViewCell
            cell.label.text = viewModel.filters[indexPath.item]
            if cell.isSelected{
                cell.backgroundColor = UIColor(named: "blue")
            }
            cell.tag = indexPath.row
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionView{
            fullDishViewController = FullDishViewController(name: viewModel.dishes.dishes[indexPath.item].name, price: viewModel.dishes.dishes[indexPath.item].price, weight: viewModel.dishes.dishes[indexPath.item].weight, description: viewModel.dishes.dishes[indexPath.item].description,url: viewModel.dishes.dishes[indexPath.item].imageURL)
            self.present(fullDishViewController, animated: true, completion: nil)
        }
    }
    
    
   
}

//extension CategoryViewController: UICollectionViewDelegate{
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//    }
//
//}
