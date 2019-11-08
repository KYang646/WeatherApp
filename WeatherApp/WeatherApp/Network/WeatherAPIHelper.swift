//
//  DarkSkyAPI.swift
//  WeatherApp
//
//  Created by Kimball Yang on 11/6/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

class WeatherAPIHelper {
    
    private init() {}
    
    static let shared = WeatherAPIHelper()
    func getWeather(latitude: Double, longitude: Double, completionHandler: @escaping (Result<[WeatherForecast],AppError>) -> () ) {
        
        let urlStr = "https://api.darksky.net/forecast/162593bfd27b6ae62ec0b7dbaaa429d6/\(latitude),\(longitude)"
    guard let url = URL(string: urlStr) else {
        completionHandler(.failure(.badURL))
        return
    }
    
    NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
        switch result {
        case .failure(let error):
            print(error)
        case .success(let data):
            do {
                let weatherInfo = try JSONDecoder().decode(WeatherResults.self, from: data)
                completionHandler(.success(weatherInfo.daily.data))
            } catch {
                completionHandler(.failure(.couldNotParseJSON(rawError: error)))
            }
        }
    }
  }
}



