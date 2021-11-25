//
//  CurrentWeatherDTO.swift
//  Skywalker
//
//  Created by Nikolai Emil Damm on 25/11/2021.
//

import Foundation

struct CurrentWeatherDTO : Codable{
    let temp, feels_like: Double
    //let pressure, humidity: Int
    //let windSpeed, windDeg: Int
    //let weather: [WeatherDTO]
    //let rain: RainDTO
}

