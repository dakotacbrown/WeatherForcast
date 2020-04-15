//
//  MidView.swift
//  WeatherForcast
//
//  Created by Dakota-Cheyenne Brown on 4/14/20.
//  Copyright © 2020 Dakota-Cheyenne Brown. All rights reserved.
//

import SwiftUI

struct MidView: View {
    
    @ObservedObject var forecastView: ForecastView
    
    var body: some View {
        VStack {
            VStack {
                Text("\(self.forecastView.currentCity), \(self.forecastView.currentCountry)")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.light)
                    .padding(.trailing, 200)
                Text("\(self.forecastView.weatherDay)")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .bold()
                    .padding(.trailing, 200)
            }
            Spacer()
        }
    }
}
