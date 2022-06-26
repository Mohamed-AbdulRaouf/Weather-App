//
//  HistoricalDataVC+create.swift
//  Weather App
//
//  Created by mohamed on 6/26/22.
//

import UIKit

extension HistoricalDataVC {
    
    public func create(cityName: String) -> HistoricalDataVC {
        let historicalDataVC = HistoricalDataVC()
        historicalDataVC.cityName = cityName
        return historicalDataVC
    }
}
