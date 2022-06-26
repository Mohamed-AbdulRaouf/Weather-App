//
//  Weather.swift
//  Weather App
//
//  Created by mohamed on 6/26/22.
//

import Foundation

struct WeatherModel : Codable {
    let weather : [Weather]?
    let main : Main?
    let wind : Wind?
    let sys : Sys?
    let name : String?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        weather = try values.decodeIfPresent([Weather].self, forKey: .weather)
        main = try values.decodeIfPresent(Main.self, forKey: .main)
        wind = try values.decodeIfPresent(Wind.self, forKey: .wind)
        sys = try values.decodeIfPresent(Sys.self, forKey: .sys)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}
