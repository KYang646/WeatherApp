//
//  DarkSkyAPI.swift
//  WeatherApp
//
//  Created by Kimball Yang on 11/6/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

class DarkSkyAPIManager {
    
    private init() {}
    
    static let shared = DarkSkyAPIManager()
    
    func getForecast(lat: Double, long: Double, completionHandler: @escaping (Result<[WeatherForecast], AppError>) -> Void) {
        let urlStr = "https://api.darksky.net/forecast/\(Secret.darkSkyAPIKey)/\(lat),\(long)"
        print(urlStr)
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let weatherInfo = try JSONDecoder().decode(WeatherModel.self, from: data)
                    completionHandler(.success(weatherInfo.daily.data))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
        
    }
    
    
    
    
    
    
    
    
}
