//
//  Request.swift
//  HavaDurumu
//
//  Created by MacBook on 18.07.2020.
//  Copyright © 2020 Baris Gorgun. All rights reserved.
//

import Foundation
import Alamofire

struct Request {
    
    
    let BASE_URL = "https://api.openweathermap.org/data/2.5/"
    let API_KEY = "3ae73327244b126160da7f667b6ec89d"
   
    
    public func getLocation(lat:Double, lon:Double, completionHandler: @escaping ((_ model: HavadurumuResponseModel?, _ error: AFError?) -> Void)){
           let url = BASE_URL + "weather?appid=" + API_KEY + "&units=metric&lat=" + String(lat) + "&lon=" + String(lon)
           
           AF.request(url, method: .get).responseDecodable { (response: DataResponse<HavadurumuResponseModel,AFError>) in
               switch response.result{
               case .success(let responseData):
                   //print(responseData)
                   completionHandler(responseData,nil)
               case .failure(let error):
                   //print(error)
                   completionHandler(nil,error)
               }
               
           }
           
       }
    
    public func getSehir(sehirAdi: String, completionHandler: @escaping ((_ model: HavadurumuResponseModel?, _ error: AFError?) -> Void)){
             let url = BASE_URL + "weather?appid=" + API_KEY + "&units=metric&q=" + sehirAdi
          
        
             AF.request(url, method: .get).responseDecodable { (response: DataResponse<HavadurumuResponseModel,AFError>) in
                 switch response.result{
                 case .success(let responseData):
                    // print(responseData)
                     completionHandler(responseData,nil)
                 case .failure(let error):
                    // print(error)
                     completionHandler(nil,error)
                 }
                 
             }
             
         }

}
