//
//  SearchViewModel.swift
//  Weather App
//
//  Created by mohamed on 6/26/22.
//

import Foundation

class SearchViewModel {
    
    func getWeatherData(cityName: String, completionHandler: @escaping CompletionHandler) {
        ManagerNetwork.shared.searchByCity(cityName) { data, error in
            completionHandler(data, error)
        }
    }
}
