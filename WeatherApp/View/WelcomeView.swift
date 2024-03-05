//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Nitin Singh Manhas on 04/03/24.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager : LocationManager
    var body: some View {
        VStack{
            VStack(spacing:20){
                Text("Welcome to the app")
                    .bold().font(.title)
                Text("please share your location to get the weather")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.reqLocation()
            }
            .cornerRadius(10)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
