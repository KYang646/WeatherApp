//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Kimball Yang on 11/8/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import XCTest

class WeatherAppTests: XCTestCase {
    @testable import WeatherApp
    
    private func getWeatherData() -> Data {
        guard let pathToData = Bundle.main.path(forResource: "Weather", ofType: "json")
            else {
                fatalError("Weather not found")
        }
        let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch let jsonError {
            fatalError("File not found: \(jsonError)")
        }
    }
    
    func testWeather() {
        let weather = WeatherResults.getWeatherData()
        XCTAssert(weather.count > 0, "IT DOESNT WORK!!")
    }

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
