//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Wiwi Oktriani on 16/09/26.
//

import Foundation

enum WeatherError: Error {
    case invalidURL
    case invalidResponse
}

class WeatherService {
    func fetchWeather(latitude: Double, longitude: Double) async throws -> WeatherResponse {
        let urlString = "https://api.open-meteo.com/v1/forecast?latitude=\(latitude)&longitude=\(longitude)&current_weather=true"
        guard let url = URL(string: urlString) else {
            throw WeatherError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw WeatherError.invalidResponse
        }

        let decoded = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return decoded
    }
}
