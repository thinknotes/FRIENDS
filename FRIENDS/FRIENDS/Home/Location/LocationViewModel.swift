//
//  LocationViewModel.swift
//  FRIENDS
//
//  Created by StudentAM on 5/7/24.
//

import Foundation
import SwiftUI
import CoreLocation

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var locationManager = CLLocationManager()
    @Published var search = ""
    
    @Published var userLocation: CLLocation!
    @Published var userAddress = ""
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
            case .authorizedWhenInUse:
                print("authorized")
                manager.requestLocation()
            case .denied:
                print("denied")
                
             default:
                print("unknown")
                locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            userLocation = location
            getLocation()
        }
    }
    
    func getLocation() {
        
        guard let location = userLocation else { return }
        
        CLGeocoder().reverseGeocodeLocation(location) { (res, err) in
            guard let safeData = res else { return }
            var address = ""
            
            address += safeData.first?.name ?? ""
            address += ", "
            address += safeData.first?.locality ?? ""
            
            self.userAddress = address
        }
    }
}
