//
//  CurrentWeatherResult.swift
//  LSJWeather
//
//  Created by yimkeul on 4/14/25.
//

import Foundation

struct CurrentWeatherResult: Codable {
    let weather: [Weather]
    let main: WeatherMain
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct WeatherMain: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let humidity: Int
}
