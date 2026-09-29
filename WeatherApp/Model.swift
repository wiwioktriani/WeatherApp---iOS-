//
//  Untitled.swift
//  WeatherApp
//
//  Created by Wiwi Oktriani on 16/09/26.
//

import Foundation

struct WeatherResponse: Codable {
    let currentWeather: CurrentWeather

    enum CodingKeys: String, CodingKey {
        case currentWeather = "current_weather"
    }
}

struct CurrentWeather: Codable {
    let temperature: Double
    let windspeed: Double
    let weathercode: Int
}
