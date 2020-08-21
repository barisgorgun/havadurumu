//
//  CLLocationManagerDelegate.swift
//  HavaDurumu
//
//  Created by MacBook on 19.07.2020.
//  Copyright © 2020 Baris Gorgun. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

extension ViewController : CLLocationManagerDelegate {
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.last {
               locationManager.stopUpdatingLocation()
               let lat = location.coordinate.latitude
               let lon = location.coordinate.longitude
                getLocation(lat: lat, lon: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func getLocation (lat: Double ,lon: Double) {
        
        request.getLocation(lat: lat,lon:lon) { (responseModel, error) in
            self.response = responseModel
            
            if self.response != nil {
                self.fillData(name: self.response?.name ?? "",temp: Int(self.response?.main.temp ?? 0) ,icon: self.response?.weather[0].icon ?? "")
                
            }
        }
    }
    
}



