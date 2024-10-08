//
//  SettingsViewModel.swift
//  WeatherApp
//
//  Created by Justin Bitancor (MDI Novare) on 9/25/24.
//

import Foundation

enum Unit: String, CaseIterable {
    case celsius = "Metric"
    case fahrenheit = "Imperial"
}

extension Unit {
    var displayName: String {
        get {
            switch(self) {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}

class SettingsViewModel {
    
    let units = Unit.allCases
    
    private var _selectedUnit: Unit = Unit.fahrenheit
    var selectedUnit: Unit {
        get {
            let userDefaults = UserDefaults.standard
            var unitValue = ""
            if let value = userDefaults.value(forKey: "unit") as? String {
                return Unit(rawValue: value)!
            }
        
            return _selectedUnit
        }
        
        set {
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: "unit")
        }
    }
}
