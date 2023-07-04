//
//  AccountViewController.swift
//  delivery_app
//
//  Created by Алексей Щукин on 03.07.2023.
//

import UIKit

class AccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        labelConstraints()
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "This is empty page"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

extension AccountViewController{
    
    func labelConstraints(){
        view.addSubview(label)
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    }
    
}
