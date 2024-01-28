//
//  WeatherManager.swift
//  Helloworld
//
//  Created by Nam Lương Xuân on 26/01/2024.
//

import Foundation


import CoreLocation

class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees , longtitude : CLLocationDegrees) async throws -> ResponseBody{
        let urlBase = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longtitude)&APPID=440665eb56e0fd8b2f6707d70c213410"
        guard let url = URL(string: urlBase) else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let(data,response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}

// MARK: - Welcome
struct ResponseBody: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}
