//
//  ForecastView.swift
//  WeatherForcast
//
//  Created by Dakota-Cheyenne Brown on 4/13/20.
//  Copyright © 2020 Dakota-Cheyenne Brown. All rights reserved.
//

import Combine
import SwiftUI
import CoreLocation

class ForecastView: ObservableObject {
    var weatherService: Service!
    var cityName: String = "Detroit"
    
    @Published var weatherForecast = ForecastWeatherResponse()
    
    init() {
        self.weatherService = Service()
    }
    
    func getForecastList() -> [MainForecastParams] {
        if let wList = self.weatherForecast.list {
            return wList
        } else {
            return []
        }
        
    }
    
    var currentCity: String {
        if let city = self.weatherForecast.city?.name {
            return city
        } else {
            return ""
        }
    }
    
    var currentCountry: String {
        if let country = self.weatherForecast.city?.country {
            return country
        } else {
            return ""
        }
    }
    
    var weatherDay: String {
        if let day = self.weatherForecast.list?.first?.dt {
            let formamtedDay = Helper().timeConverter(timeStamp: day, isDay: false)
            return formamtedDay
        } else {
            return ""
        }
    }
    
    var temperature: String {
        if let temp = self.weatherForecast.list?.first?.temp?.day {
            let formattedTemp = String(format: "%.0f", temp) + "°F"
            return formattedTemp
        } else {
            return ""
        }
    }
    
    var weatherDescription: String {
        if let desc = self.weatherForecast.list?.first?.weather?.first?.description {
            let formattedDesc = desc.capitalized(with: .current)
            return formattedDesc
        } else {
            return ""
        }
    }
    
    var windSpeed: String {
        if let speed = self.weatherForecast.list?.first?.speed {
            let formattedSpeed = String(format: "%.1f", speed) + "mi/h"
            return formattedSpeed
        } else {
            return ""
        }
    }

    var Humidity: String {
        if let hum = self.weatherForecast.list?.first?.humidity {
            let formattedHum = "\(hum)" + "%"
            return formattedHum
        } else {
            return ""
        }
    }

    var High: String {
        if let high = self.weatherForecast.list?.first?.temp?.max {
            let formattedHigh = String(format: "%.0f", high) + "°F"
            return formattedHigh
        } else {
            return ""
        }
    }

    var Low: String {
        if let low = self.weatherForecast.list?.first?.speed {
            let formattedLow = String(format: "%.0f", low) + "°F"
            return formattedLow
        } else {
            return ""
        }
    }
    
    func searchCity() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeatherForecast(by: city)
        }
    }
    
    func fetchWeatherForecast(by city: String) {
        self.weatherService.getWeatherData(city: cityName) { forecast in
            if let forecast = forecast {
                DispatchQueue.main.async {
                    self.weatherForecast = forecast
                }
            }
        }
    }
}
