//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Kimball Yang on 11/6/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

struct WeatherResults : Codable {
    let daily: WeatherWrapper
    
    enum JSONError: Error {
        case decodingError(Error)
    }
    
    static func getWeatherData() -> [WeatherForecast] {
        guard let fileName = Bundle.main.path(forResource: "Weather", ofType: "json")
            else {fatalError()}
        let fileURL = URL(fileURLWithPath: fileName)
        do {
            let data = try Data(contentsOf: fileURL)
            let weather = try
                JSONDecoder().decode(WeatherResults.self, from: data)
            return weather.daily.data
        } catch {
            fatalError("\(error)")
        }
    }
}
struct WeatherWrapper : Codable {
    let data: [WeatherForecast]
}
struct WeatherForecast : Codable {
    let icon: String
    let summary: String
    let time: Int
    let sunriseTime: Int
    let sunsetTime: Int
    let temperatureHigh: Double
    let temperatureLow: Double
    let windSpeed: Double
    let precipProbability: Double
    var precipitationChance: String {
        get {
            return "\(precipProbability * 100)%"
        }
    }
    var date : String {
        get {
            let date = NSDate(timeIntervalSince1970: TimeInterval(time)) as Date
            let df = DateFormatter()
            df.dateFormat = "MMM-dd-yyyy"
            return df.string(from:date)
        }
    }
    var realSunRiseTime: String {
        get {
            let date = NSDate(timeIntervalSince1970: TimeInterval(sunriseTime)) as Date
                       let df = DateFormatter()
                       df.dateFormat = "hh:mm a"
                       df.amSymbol = "AM"
                       df.pmSymbol = "PM"
                       return df.string(from:date)
        }
    }
    var realSunSetTime: String {
        get {
            let date = NSDate(timeIntervalSince1970: TimeInterval(sunsetTime)) as Date
                       let df = DateFormatter()
                       df.dateFormat = "hh:mm a"
                       df.amSymbol = "AM"
                       df.pmSymbol = "PM"
                       return df.string(from:date)
        }
    }
}
