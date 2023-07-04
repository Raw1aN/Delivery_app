//
//  LocationView.swift
//  delivery_app
//
//  Created by Алексей Щукин on 30.06.2023.
//

import UIKit

class LocationView: UIView {

    func configure(){
        
    }

    init(){
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let locationPicture: UIView = {
        let image = UIImageView(image: UIImage(named: "Location"))
        let view = UIView()
        view.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: view.topAnchor, constant: 4).isActive = true
        return view
    }()
    
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Неизвестный город"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "12 Августа, 2023"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .gray
        return label
    }()

}

extension LocationView{
    
    func initialize(){
        let infostackView = UIStackView(arrangedSubviews: [locationLabel,dateLabel])
        infostackView.spacing = 4
        infostackView.alignment = .leading
        infostackView.axis = .vertical
        let mainStackView = UIStackView(arrangedSubviews: [locationPicture,infostackView])
        mainStackView.spacing = 27
        mainStackView.alignment = .firstBaseline
        mainStackView.axis = .horizontal
        addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
    }
    
    func getDate(title: String){
        dateLabel.text = title
    }
    
    func updateLocation(city: String){
        locationLabel.text = city
    }
    
}
