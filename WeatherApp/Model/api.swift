//
//  api.swift
//  WeatherApp
//
//  Created by Nitin Singh Manhas on 25/02/24.
//

import Foundation


func callApi(){
    guard let url = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=33.44&lon=-94.04&exclude=hourly,daily,alerts&appid={fef1b5ffb6fc8353026c989cf61898d2}") else{
        return
    }
    let task = URLSession.shared.dataTask(with: url){
        data,response,error in
        if let data = data, let string = String(data:data,encoding: .utf8){
            print(string)
        }
    }
    task.resume()
    callApi()
}



