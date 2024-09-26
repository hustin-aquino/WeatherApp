//
//  WeatherListViewModelTests.swift
//  WeatherAppTests
//
//  Created by justin.bitancor on 9/26/24.
//

import XCTest
@testable import WeatherApp

final class WeatherListViewModelTests: XCTestCase {
    
    private var weatherListVM: WeatherListViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.weatherListVM = WeatherListViewModel()
        
        self.weatherListVM.addWeatherViewModel(WeatherViewModel(weather: WeatherResponse(name: "Calamba", main: Weather(temp: 90, humidity: 0))))
        self.weatherListVM.addWeatherViewModel(WeatherViewModel(weather: WeatherResponse(name: "Los Baños", main: Weather(temp: 89, humidity: 0))))
    }
    
    func test_should_be_able_to_convert_to_celsius_successfully() {
     
        let celsiusTemperatures = [32.2222, 31.6667]
        self.weatherListVM.updateUnit(to: .celsius)
        
        for (index, vm) in self.weatherListVM._weatherViewModels.enumerated() {
            XCTAssertEqual(round(vm.temperature), round(celsiusTemperatures[index]))
        }
    }
    
    func test_should_be_able_to_convert_to_fahrenheit_successfully() {
        
        let fahrenheitTemperatures = [194, 192.2]
        self.weatherListVM.updateUnit(to: .fahrenheit)
        
        for (index, vm) in self.weatherListVM._weatherViewModels.enumerated() {
            XCTAssertEqual(round(vm.temperature), round(fahrenheitTemperatures[index]))
        }
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
