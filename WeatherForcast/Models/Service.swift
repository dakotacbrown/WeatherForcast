//
//  Service.swift
//  WeatherForcast
//
//  Created by Dakota-Cheyenne Brown on 4/13/20.
//  Copyright © 2020 Dakota-Cheyenne Brown. All rights reserved.
//

import Foundation

class Service: ObservableObject {

    let apiID = "ed60fcfbd110ee65c7150605ea8aceea"

    func getWeatherData(city: String, completion: @escaping
        (ForecastWeatherResponse?)->()) {

        guard let url = URL(string:
            "https://api.openweathermap.org/data/2.5/forecast/daily?q=\(city)&appid=\(apiID)&units=imperial") else {
                completion(nil)
                return
        }

        URLSession.shared.dataTask(with: url) { data, resonse, error in
            guard let data = data,
                error == nil else {
                    completion(nil)
                    return
            }

            let weatherResponse = try? JSONDecoder().decode(ForecastWeatherResponse.self, from:data)

            if let weatherResponse = weatherResponse {
                completion(weatherResponse)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
