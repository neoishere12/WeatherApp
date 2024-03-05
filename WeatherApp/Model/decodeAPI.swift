//
//  decodeAPI.swift
//  WeatherApp
//
//  Created by Nitin Singh Manhas on 01/03/24.
//

import Foundation

func decodeAPI(){
    
    guard let url = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=33.44&lon=-94.04&exclude=hourly,daily,alerts&appid={fef1b5ffb6fc8353026c989cf61898d2}") else{return}
    
    let task = URLSession.shared.dataTask(with: url){
        data,response,error in
        
        let decoder = JSONDecoder()
        
        if let data = data{
            do{
                let tasks = try decoder.decode([WeatherResponse].self,from:data)
                tasks.forEach{ i in
                    print(i.lat)
                }
            }catch{
                print(error)
            }
        }
    }
    task.resume()
}
