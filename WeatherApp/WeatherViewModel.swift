//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Wiwi Oktriani on 16/09/26.
//
import Foundation
import Combine

@MainActor
class WeatherViewModel: ObservableObject {
    @Published var temperature: Double?
    @Published var windspeed: Double?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service = WeatherService()

    func loadWeather() async {
        isLoading = true
        errorMessage = nil

        do {
            // Koordinat Jakarta
            let result = try await service.fetchWeather(latitude: -6.2088, longitude: 106.8456)
            temperature = result.currentWeather.temperature
            windspeed = result.currentWeather.windspeed
        } catch {
            errorMessage = "Gagal mengambil data cuaca. Coba lagi."
        }

        isLoading = false
    }
}
