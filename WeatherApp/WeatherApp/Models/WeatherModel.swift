//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Kimball Yang on 11/6/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

struct DarkSkyWeatherModel: Codable {
    let daily: Weather
}

struct Weather: Codable {
    let data: [WeatherForecast]
}

struct WeatherForecast: Codable {
    let icon: String
    let temperatureHigh: Double
    let temperatureLow: Double
    let windSpeed: Double
    let precipIntensityMax: Double
    let time: Int
    let sunriseTime: Int
    let sunsetTime: Int
    //var convertedTime: String {
        
    //}
}
