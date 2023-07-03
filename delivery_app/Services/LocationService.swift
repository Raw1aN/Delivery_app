//
//  LocationService.swift
//  delivery_app
//
//  Created by Алексей Щукин on 02.07.2023.
//

import Combine
import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate{
    
    let locationManager = CLLocationManager()
    
    override init(){
        super.init()
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let _:CLLocationCoordinate2D = manager.location!.coordinate
    }
    
}

