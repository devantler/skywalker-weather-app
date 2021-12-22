//
//  TemperatureDTO.swift
//  Skywalker
//
//  Created by Nikolai Emil Damm on 25/11/2021.
//

import Foundation

struct TemperatureDTO :Codable{
    let day, min, max, night: Double
    let eve, morn: Double
}
