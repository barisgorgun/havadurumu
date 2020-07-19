//
//  ViewController.swift
//  HavaDurumu
//
//  Created by MacBook on 6.06.2020.
//  Copyright © 2020 Baris Gorgun. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var lblTemperature: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var lblSummary: UILabel!
    @IBOutlet weak var lblPrecipitation: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var btnRefresh: UIButton!
 
    var response : HavadurumuResponseModel?
    
    var lon : Double = -0.13
    var lat : Double = 51.51
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
         let request = Request()
            
        request.getLocation(lat: lat,lon: lon) { (responseModel, error) in
            self.response = responseModel
            self.lblTemperature.text = "\(self.response!.main.temp)°C"
            self.lblHumidity.text = "%\(self.response!.main.humidity)"
            self.lblSummary.text = self.response!.name
            
            
        }
        
        
        
        
       
        
    }
    
    /*public func fillData( filmImageUrlStr:String) {
       
        let url = URL(string: "https://image.tmdb.org/t/p/original" + filmImageUrlStr)
        if let url = url {
            weatherIcon.kf.indicatorType = .activity
            weatherIcon.kf.setImage(with: url)
        }
    }*/


}

