//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Prashant on 02/08/24.
//

import Foundation

class WeatherService {
    
    func getWeather(city: String, completion: @escaping (WeatherData?) -> ()) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid={API-KEY}&units=imperial") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let weatherData = try? JSONDecoder().decode(WeatherData.self, from: data)
            completion(weatherData)
        }
        .resume()
    }
}
