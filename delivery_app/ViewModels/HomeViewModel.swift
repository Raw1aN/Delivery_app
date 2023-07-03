//
//  HomeViewModel.swift
//  delivery_app
//
//  Created by Алексей Щукин on 01.07.2023.
//

import Foundation
import CoreLocation

class HomeViewModel {
    
    private let apiService = ApiService()
    private let dateService = DateService()
    private let locationService = LocationService()
    
    var categories = Categories(сategories: [])
    var location = String()
    
    
    func getCategories(complition: @escaping () -> Void){
        
        apiService.getCategories { result in
            switch result {
            case .succes(let succes):
                self.categories = succes
                complition()
            case .failure(error: let error):
                print(error)
                complition()
            }
        }
        
    }
    
    func getDate() -> String{
        return dateService.getDate()
    }
    
    func getLocation(complition: @escaping (String) -> Void){
        
        DispatchQueue.global().async {
            while (true){
                if self.locationService.locationManager.location != nil{
                    break
                }
            }
            guard let locValue:CLLocationCoordinate2D = self.locationService.locationManager.location?.coordinate else { return }
            let geoCoder = CLGeocoder()
            let location = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)
            geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
                
                var placeMark: CLPlacemark!
                placeMark = placemarks?[0]
                if let city = placeMark.locality {
                    complition(city)
                    print(city)
                }
            })
        }
        
        
    }
    
}
