//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Nitin Singh Manhas on 04/03/24.
//

import Foundation
import CoreLocation

class WeatherManager{
    func getWeather(latitude:CLLocationDegrees,longitude:CLLocationDegrees) async throws->ResponseBody{
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=fef1b5ffb6fc8353026c989cf61898d2") else{
            fatalError("url missing")
        }
        
        let urlRequest = URLRequest(url:url)
        
        let(data,response) = try await URLSession.shared.data(for: urlRequest)
        
        guard(response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("error fetching weather data")}
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from:data)
        return decodedData
    }
}

struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}

extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}
