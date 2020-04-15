//
//  Data.swift
//  WeatherForcast
//
//  Created by Dakota-Cheyenne Brown on 4/13/20.
//  Copyright © 2020 Dakota-Cheyenne Brown. All rights reserved.
//

import Foundation

struct ForecastWeatherResponse: Decodable {
    var city: City?
    var cod: String?
    var message: Double?
    var cnt: Int?
    var list: [MainForecastParams]?
}

struct City: Decodable {
    var id: Int?
    var name: String?
    var coord: Coord?
    var country: String?
    var population: Int?
    var timezone: Int?
}

struct Coord: Decodable {
    var long: Double?
    var lat: Double?
}

struct MainForecastParams: Decodable {
    var dt: Int?
    var temp: Temp?
    var pressure: Double?
    var humidity: Int?
    var weather: [Weather]?
    var speed: Double?
    var deg: Int?
    var clouds: Int?
}

struct Temp: Decodable {
    var day: Double?
    var min: Double?
    var max: Double?
    var night: Double?
    var eve: Double?
    var morn: Double?
}

struct Weather: Decodable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}
