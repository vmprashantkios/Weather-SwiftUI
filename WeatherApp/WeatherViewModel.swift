//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Prashant on 02/08/24.
//

import Foundation

@MainActor
class WeatherViewModel: ObservableObject {
    private let weatherService: WeatherService
    
    
    @Published var weather: WeatherData?
    @Published var dataGet: Bool = false
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
     func fetchWeatherFor(city: String)  {
        weatherService.getWeather(city: city) { weather in
            DispatchQueue.main.async {
                self.weather = weather
                self.dataGet = true
            }
        
        }
    }
    
    func fahrenheitToCelsius(_ f: Double) -> String {
        return ((f - 32) * 5/9).getTempratureWithDegreeSymbol()
    }
    
    func getTimeFromTimeStamp(_ timeStamp: Double) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        let date = Date(timeIntervalSince1970: timeStamp)
        return dateFormatter.string(from: date)
    }
    
}
