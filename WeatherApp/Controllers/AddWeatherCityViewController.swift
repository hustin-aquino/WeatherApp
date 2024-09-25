//
//  AddWeatherCityViewController.swift
//  WeatherApp
//
//  Created by Justin Bitancor (MDI Novare) on 9/25/24.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    private var addWeatherVM = AddWeatherViewModel()
    
    var delegate: AddWeatherDelegate?
    
    
    @IBAction func saveCityButtonPressed(_ sender: UIButton) {
        if let city = cityNameTextField.text {
            addWeatherVM.addWeather(for: city) { (vm) in
                if let delegate = self.delegate {
                    delegate.addWeatherDidSave(vm: vm)
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func close(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
