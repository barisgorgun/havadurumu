//
//  File.swift
//  HavaDurumu
//
//  Created by MacBook on 19.07.2020.
//  Copyright © 2020 Baris Gorgun. All rights reserved.
//

import Foundation
import UIKit


extension ViewController : UITextFieldDelegate {
    
    @IBAction func aramaPressed(_ sender: Any) {
        aramaTextField.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        aramaTextField.endEditing(true)
        return true
    }
   
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let sehir = aramaTextField.text {
            request.getSehir(sehirAdi: sehir){ (responseModel, error) in
                self.response = responseModel
                
                if self.response != nil {
                    self.fillData(name: self.response?.name ?? "",temp: Int(self.response?.main.temp ?? 0) ,icon: self.response?.weather[0].icon ?? "")
                }
            }
        }
        aramaTextField.text = ""
    }
    
    
}


