//
//  ViewController.swift
//  HavaDurumu
//
//  Created by MacBook on 6.06.2020.
//  Copyright © 2020 Baris Gorgun. All rights reserved.
//

import UIKit
import Kingfisher
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var sicakliklbl: UILabel!
    @IBOutlet weak var havadurumuimg: UIImageView!
    @IBOutlet weak var sehirlbl: UILabel!
    @IBOutlet weak var aramaTextField: UITextField!
    
    var response : HavadurumuResponseModel?
    let request = Request()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        aramaTextField.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        
    }
    
    @IBAction func lokasyonPressed(_ sender: Any) {
         locationManager.requestLocation()
    }
    
    
    public func fillData(name: String ,temp: Int, icon:String) {
        
        let url = URL(string: "http://openweathermap.org/img/wn/" + icon + "@2x.png")
        self.sehirlbl.text = name
        self.sicakliklbl.text = "\(temp)"
        
        if let url = url {
            havadurumuimg.kf.indicatorType = .activity
            havadurumuimg.kf.setImage(with: url)
        }
    }
    
}
