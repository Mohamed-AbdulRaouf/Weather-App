//
//  DetailsModalViewModel.swift
//  Weather App
//
//  Created by mohamed on 6/26/22.
//

import Foundation
import UIKit

class DetailsModalViewModel {
    
    var controller: DetailsModalVC?
    
    init(controller: DetailsModalVC? = nil) {
        self.controller = controller
    }
    
    func getWeatherDataBy(cityName: String) {
        self.controller?.startLoading(message: "Loading...")
        ManagerNetwork.shared.searchByCity(cityName) { [weak self] data, error in
            self?.controller?.stopLoading()
            guard let self = self else {return}
            guard let data = data else {return}
            self.controller?.updateUI(weather: data)
        }
    }
    
    func getImageFromUrl(_ iconName: String) {
        self.controller?.startLoading(message: "Loadin image")
        ManagerNetwork.shared.downloadImage(iconName: iconName) {[weak self] data, error in
            guard let self = self else {return}
            self.controller?.stopLoading()
            if let image = data {
                DispatchQueue.main.async {
                    self.controller?.setCloudImage(image: image)
                }
            }
        }
    }
}
