//
//  ScrollCast.swift
//  WeatherForcast
//
//  Created by Dakota-Cheyenne Brown on 4/14/20.
//  Copyright © 2020 Dakota-Cheyenne Brown. All rights reserved.
//

import SwiftUI

struct ScrollCast: View {
    
    let forecastData: MainForecastParams
    @State var icon = ""
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topLeading) {
                Text(String(Helper().timeConverter(timeStamp: forecastData.dt!, isDay: true)))
                    .foregroundColor(.white)
            }.offset(y: -75)
            
            HStack {
                Image(systemName: Helper().showWeatherIcon(item: forecastData))
                    .resizable()
                    .frame(width:60, height: 60)
                    .foregroundColor(Color("secondary"))
                    .background(RoundedRectangle(
                        cornerRadius: 60)
                        .frame(width: 90, height: 80)
                        .foregroundColor(Color("lightBlue")))
                    .padding(.all, 20)
                    .offset(x: -20)
                
                VStack(alignment: .leading,  spacing: 5) {
                    HStack {
                        Text(String(format: "%.0f", (forecastData.temp?.max)!) + "°F")
                            .foregroundColor(.white)
                        
                        Image(systemName: "arrow.up")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.white)
                    }
                    
                    HStack {
                        Text(String(format: "%.0f", (forecastData.temp?.min)!) + "°F")
                            .foregroundColor(.white)
                        
                        Image(systemName: "arrow.down")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.white)
                    }
                    
                    Text("Hum: \(String(format: "%.0f", (forecastData.humidity)!))%")
                        .foregroundColor(.white)
                        .font(.subheadline)
                    
                    Text("Wind: \(String(format: "%.1f", (forecastData.speed)!))mi/h")
                        .foregroundColor(.white)
                        .font(.subheadline)
                }
                Spacer()
            }
        }.frame(width: 220, height: 200)
            .background(Color("bg"))
            .cornerRadius(30)
            .padding(.leading, 15)
    }
}
