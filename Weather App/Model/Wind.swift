//
//  Wind.swift
//  Weather App
//
//  Created by mohamed on 6/26/22.
//

import Foundation

struct Wind : Codable {
    let speed : Double?
    let deg : Int?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        speed = try values.decodeIfPresent(Double.self, forKey: .speed)
        deg = try values.decodeIfPresent(Int.self, forKey: .deg)
    }
}
