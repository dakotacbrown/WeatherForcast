//
//  TopView.swift
//  WeatherForcast
//
//  Created by Dakota-Cheyenne Brown on 4/14/20.
//  Copyright © 2020 Dakota-Cheyenne Brown. All rights reserved.
//

import SwiftUI

let UIWidth = UIScreen.main.bounds.width
let UIHeight = UIScreen.main.bounds.height

struct TopView: View {
    
    @ObservedObject var forecastView: ForecastView
    
    var body: some View {
        ZStack {
            ZStack(alignment: .leading) {
                HStack(spacing: 5){
                    Image(systemName: "mappin.circle")
                        .padding(.leading)
                    Group{
                        TextField("Enter City Name", text: self.$forecastView.cityName) {
                            self.forecastView.searchCity()
                        }.padding(.all, 10)
                    }
                }.frame(width: UIWidth - 50, height: 50)
                    .background(Color("lightBlue"))
                    .foregroundColor(.white)
                    .cornerRadius(30)
            }
        }.onAppear(perform: fetch)
    }
    
    private func fetch() {
        self.forecastView.searchCity()
    }
}
