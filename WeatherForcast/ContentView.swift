//
//  ContentView.swift
//  WeatherForcast
//
//  Created by Dakota-Cheyenne Brown on 4/13/20.
//  Copyright © 2020 Dakota-Cheyenne Brown. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var forecastView: ForecastView
    
    init() {
        self.forecastView = ForecastView()
    }
    
    var body: some View {
        ZStack {
            BGView()
            VStack {
                TopView(forecastView: self.forecastView)
                MidView(forecastView: self.forecastView)
            }
            
            VStack(alignment: .center, spacing: 8) {
                Image(systemName: Helper().showWeatherIcon(item: self.forecastView.weatherForecast))
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .foregroundColor(.white)
                CurrentTemp(forecastView: self.forecastView)
                
                Text("7-Day Weather Forecast")
                    .foregroundColor(.white)
                    .bold()
                    .padding(.all, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(forecastView.getForecastList(), id: \.dt) {forecast in
                            ScrollCast(forecastData: forecast)
                        }
                    }
                }
            }.padding(.top, 50)
        }
    }
}
