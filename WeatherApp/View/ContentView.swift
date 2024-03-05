//
//  ContentView.swift
//  WeatherApp
//
//  Created by Nitin Singh Manhas on 25/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather : ResponseBody?
    var body: some View {
        VStack {
            
            if let location = locationManager.location{
                if let weather = weather{
                    WeatherView(weather: weather)
                }
                else{
                    LoadingView()
                        .task {
                            do{
                               weather = try await weatherManager.getWeather(latitude: location.latitude, longitude: location.longitude)
                            }
                            catch{
                                print("error getting weather \(error)")
                            }
                        }
                }
            }
            else{
                if locationManager.isLoading{
                    LoadingView()
                } else{
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
           
        }
        .background(Color.black)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
