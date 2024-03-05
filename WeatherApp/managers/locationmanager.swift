//
//  locationmanager.swift
//  WeatherApp
//
//  Created by Nitin Singh Manhas on 04/03/24.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    let manager = CLLocationManager()
    
    @Published var location : CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init(){
        super.init()
        manager.delegate = self
    }
    
    func reqLocation(){
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error",error)
        isLoading = false
    }
}
