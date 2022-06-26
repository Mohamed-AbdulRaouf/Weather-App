//
//  HistoricalDataViewModel.swift
//  Weather App
//
//  Created by mohamed on 6/26/22.
//

import Foundation

class HistoricalDataViewModel {
    
    var controller: HistoricalDataVC?
    var historicalData = [HistoricalData]()
    
    init(controller: HistoricalDataVC? = nil) {
        self.controller = controller
    }
    
    func featchData(cityName: String) {
        CoreDataManager.shared.fetchCitiesDataBy(cityName: cityName) { data in
            guard let data = data else {return}
            self.historicalData = data
            self.controller?.reloadData()
        }
    }
}
