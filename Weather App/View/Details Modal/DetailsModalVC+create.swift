//
//  DetailsModalVC+create.swift
//  Weather App
//
//  Created by mohamed on 6/26/22.
//

import UIKit

extension DetailsModalVC {
    
    public func create(cityName: String) -> UIViewController {
        let detailsModalVC = DetailsModalVC()
        detailsModalVC.cityName = cityName
        return detailsModalVC
    }
}
