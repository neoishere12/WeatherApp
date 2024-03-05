//
//  post.swift
//  WeatherApp
//
//  Created by Nitin Singh Manhas on 25/02/24.
//

import Foundation

struct WeatherResponse: Codable {
    let lat: Double
    let lon: Double
    let timezone: String
    let timezone_offset: Int
    let current: CurrentWeather
    let minutely: [MinutelyWeather]
    let hourly: [HourlyWeather]
    let daily: [DailyWeather]
    let alerts: [WeatherAlert]?
}

struct CurrentWeather: Codable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let temp: Double
    let feels_like: Double
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let wind_speed: Double
    let wind_deg: Int
    let wind_gust: Double
    let weather: [WeatherDescription]
}

struct MinutelyWeather: Codable {
    let dt: Int
    let precipitation: Double
}

struct HourlyWeather: Codable {
    let dt: Int
    let temp: Double
    let feels_like: Double
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let wind_speed: Double
    let wind_deg: Int
    let wind_gust: Double
    let weather: [WeatherDescription]
    let pop: Double
}

struct DailyWeather: Codable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let moonrise: Int
    let moonset: Int
    let moon_phase: Double
    let summary: String
    let temp: Temperature
    let feels_like: FeelsLike
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let wind_speed: Double
    let wind_deg: Int
    let wind_gust: Double
    let weather: [WeatherDescription]
    let clouds: Int
    let pop: Double
    let rain: Double?
    let uvi: Double
}

struct WeatherAlert: Codable {
    let sender_name: String
    let event: String
    let start: Int
    let end: Int
    let description: String
    let tags: [String]
}

struct Temperature: Codable {
    let day: Double
    let min: Double
    let max: Double
    let night: Double
    let eve: Double
    let morn: Double
}

struct FeelsLike: Codable {
    let day: Double
    let night: Double
    let eve: Double
    let morn: Double
}

struct WeatherDescription: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
