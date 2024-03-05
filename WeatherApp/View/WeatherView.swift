//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Nitin Singh Manhas on 05/03/24.
//

import SwiftUI

struct WeatherView: View {
    var weather : ResponseBody
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today,\(Date().formatted(.dateTime.month().day().hour().minute()))")
                    
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing:20){
                            Image(systemName: "cloud")
                                .font(.system(size:40))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding()
                    }
                    Spacer()
                        
                    
                    AsyncImage(url: URL(string: "https://i.pinimg.com/564x/c4/8c/bf/c48cbfce14a3ee4b6457e96661779533.jpg")){ image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:350)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity,alignment:.leading)
            }
            .padding()
            .frame(maxWidth: .infinity,alignment: .leading)
            
            VStack{
                Spacer()
                VStack(alignment: .leading , spacing:20){
                    Text("weather now")
                        .bold().padding(.bottom)
                    HStack{
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble()+"°"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMin.roundDouble()+"°"))
                    }
                    HStack{
                        WeatherRow(logo: "wind", name: "wind speed", value: (weather.wind.speed.roundDouble()+"m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "humidity", value: (weather.main.humidity.roundDouble()+"%"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom,20)
                .foregroundColor(.blue)
                .background(.white)
                .cornerRadius(20, corners: [.topLeft,.topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.blue)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
