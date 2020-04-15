//
//  CurrentTemp.swift
//  WeatherForcast
//
//  Created by Dakota-Cheyenne Brown on 4/14/20.
//  Copyright © 2020 Dakota-Cheyenne Brown. All rights reserved.
//

import SwiftUI

struct CurrentTemp: View {
    
    @ObservedObject var forecastView = ForecastView()
    
    var body: some View {
        VStack {
            HStack {
                Text(self.forecastView.temperature)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .bold()
                Text(self.forecastView.weatherDescription)
                    .foregroundColor(Color("secondary"))
            }
            HStack {
                VStack {
                    Text(self.forecastView.windSpeed)
                        .foregroundColor(Color("secondary"))
                    Text("Wind")
                        .foregroundColor(Color("secondary"))
                }.padding(.all, 5)
                VStack {
                    Text(self.forecastView.Humidity)
                        .foregroundColor(Color("secondary"))
                    Text("Humidity")
                        .foregroundColor(Color("secondary"))
                }.padding(.all, 5)
                VStack {
                    HStack {
                    Text(self.forecastView.High)
                        .foregroundColor(Color("secondary"))
                        .frame(width: 40)
                        Image(systemName: "arrow.up")
                    }
                    HStack {
                        Text(self.forecastView.Low)
                        .foregroundColor(Color("secondary"))
                        .frame(width: 40)
                        Image(systemName: "arrow.down")
                    }
                }.padding(.all, 5)
            }
        }
    }
}

