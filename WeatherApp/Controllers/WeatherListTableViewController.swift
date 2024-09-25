//
//  WeatherListTableViewController.swift
//  WeatherApp
//
//  Created by Justin Bitancor (MDI Novare) on 9/25/24.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let resource = Resource<WeatherResponse>(url: URL(string: "https://api.openweathermap.org/data/2.5/weather?q=London&appid=81a0585697c9cd3fd655d47f896b1a7f&units=imperial")!) { data in
            return try? JSONDecoder().decode(WeatherResponse.self, from: data)
        }
        
        Webservice().load(resource: resource) { weatherResponse in
            if let weatherResponse = weatherResponse {
                print(weatherResponse)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        
        cell.cityNameLabel.text = "Houston"
        cell.temperatureLabel.text = "70°"
        return cell
    }
}
