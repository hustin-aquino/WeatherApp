//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Justin Bitancor (MDI Novare) on 9/25/24.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let main: Weather
}

struct Weather: Decodable {
    var temp: Double
    var humidity: Double
}
