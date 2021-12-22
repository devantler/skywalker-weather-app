//
//  DailyForecastDTO.swift
//  Skywalker
//
//  Created by Nikolai Emil Damm on 25/11/2021.
//

import Foundation

struct DailyForecastDTO : Codable {
    let dt: Double
    let temp: TemperatureDTO
    //let feels_like: FeelsLikeDTO
    //let pressure, humidity: Int
    //let windSpeed: Double
    //let windDeg: Int
    let weather: [WeatherDTO]
    //let clouds: Int
    //let rain: Double
}
