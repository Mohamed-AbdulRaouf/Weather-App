//
//  Weather.swift
//  Weather App
//
//  Created by mohamed on 6/26/22.
//

import Foundation

struct Weather : Codable {
    let id : Int?
    let main : String?
    let description : String?
    let icon : String?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        main = try values.decodeIfPresent(String.self, forKey: .main)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
    }
}
