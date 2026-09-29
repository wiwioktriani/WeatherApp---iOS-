//
//  ContentView.swift
//  WeatherApp
//
//  Created by Wiwi Oktriani on 12/09/26.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("Jakarta")
                .font(.title)
                .fontWeight(.semibold)

            if viewModel.isLoading {
                ProgressView()
            } else if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            } else if let temp = viewModel.temperature {
                Text("\(temp, specifier: "%.1f")°C")
                    .font(.system(size: 56, weight: .bold))

                if let wind = viewModel.windspeed {
                    Text("Angin: \(wind, specifier: "%.1f") km/h")
                        .foregroundColor(.secondary)
                }
            }

            Button("Refresh") {
                Task {
                    await viewModel.loadWeather()
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .task {
            await viewModel.loadWeather()
        }
    }
}

#Preview {
    WeatherView()
}
