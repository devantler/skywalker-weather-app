//
//  RainDTO.swift
//  Skywalker
//
//  Created by Nikolai Emil Damm on 25/11/2021.
//

import Foundation

struct RainDTO: Codable {
    let the1H: Double
    
    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }
}
