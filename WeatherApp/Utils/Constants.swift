//
//  Constants.swift
//  WeatherApp
//
//  Created by Justin Bitancor (MDI Novare) on 9/25/24.
//

import Foundation

struct Constants {
    
    struct Urls {
        static func urlForWeatherByCity(city: String) -> URL {
            
            // get the default settings for temperature
            // let userDefaults = UserDefaults.standard
            // let unit = (userDefaults.value(forKey: "unit") as? String) ?? "Imperial"
            
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=81a0585697c9cd3fd655d47f896b1a7f&units=imperial")!
        }
    }
}
