//
//  AddWeatherCityViewController.swift
//  WeatherApp
//
//  Created by Justin Bitancor (MDI Novare) on 9/25/24.
//

import Foundation
import UIKit

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    
    @IBAction func saveCityButtonPressed(_ sender: UIButton) {
        
        if let city = cityNameTextField.text {
            
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=81a0585697c9cd3fd655d47f896b1a7f&units=imperial")!
            
            let weatherResource = Resource<WeatherResponse>(url: weatherURL) { data in
                
                guard  let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data) else {
                    fatalError("Error in parsing WeatherResponse")
                }
                
                return weatherResponse
            }
            
            Webservice().load(resource: weatherResource) { result in
                
            }
        }
    }
    
    @IBAction func close(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
