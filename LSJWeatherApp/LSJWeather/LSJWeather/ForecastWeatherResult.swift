//
//  ForecastWeatherResult.swift
//  LSJWeather
//
//  Created by yimkeul on 4/14/25.
//

import Foundation

struct ForecastWeatherResult: Codable {
    let list: [ForecastWeather]
}

struct ForecastWeather: Codable {
    let main: WeatherMain
    let dtTxt: String
    
    enum CodingKeys: String, CodingKey {
        case main
        case dtTxt = "dt_txt"
    }
}
