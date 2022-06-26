//
//  HomeViewModel.swift
//  Weather App
//
//  Created by mohamed on 6/25/22.
//

import Foundation
import UIKit

class HomeViewModel {
    var controller: UIViewController?
    var cities = [String]()
    
    init(controller: UIViewController? = nil) {
        self.controller = controller
    }
    
    func fetchCities() {
        self.controller?.startLoading(message: "fetch cities")
        CoreDataManager.shared.fetchCitiesData(completionHandler: { [weak self] data in
            guard let self = self else { return }
            self.controller?.stopLoading()
            guard let data = data else {return}
            self.cities = data
        })
    }
}
