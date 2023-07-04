//
//  BasketViewModel.swift
//  delivery_app
//
//  Created by Алексей Щукин on 03.07.2023.
//

import Foundation
import CoreLocation

class BasketViewModel{
    
    private let dateService = DateService()
    private let locationService = LocationService()
    
    var dishes = [BasketDishes]()
    
    var location = String()
    
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
                }
            })
        }
        
        
    }
    
    func getDishes(complition: @escaping () -> Void){
        
        // time changes
        dishes = Basket.sharedInstance.dishes
        complition()
    }
    
}
