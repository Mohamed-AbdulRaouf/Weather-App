//
//  DetailsModalVC.swift
//  Weather App
//
//  Created by mohamed on 6/25/22.
//

import UIKit

class DetailsModalVC: BaseVC<DetailsModalView> {
    
    var viewModel = DetailsModalViewModel()
    var cityName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = DetailsModalViewModel(controller: self)
        mainView.delegate = self
        viewModel.getWeatherDataBy(cityName: self.cityName ?? "")
    }
    
    func updateUI(weather: WeatherModel) {
        self.mainView.headerLbl.text = self.cityName ?? ""
        self.mainView.descriptionValueLbl.text = weather.weather?.first?.description ?? ""
        self.mainView.temperatureValueLbl.text = "\(weather.main?.temp ?? 0.0)∘C"
        self.mainView.humidityValueLbl.text = "\(weather.main?.humidity ?? 0)%"
        self.mainView.windspeedValueLbl.text = "\(weather.wind?.speed ?? 0.0) Km/h"
        self.mainView.bottomLbl.text?.append(" \(self.cityName ?? "") \(Date())")
        self.viewModel.getImageFromUrl(weather.weather?.first?.icon ?? "")
    }
    
    func setCloudImage(image: UIImage) {
        self.mainView.cloudImage.image = image
    }
}
