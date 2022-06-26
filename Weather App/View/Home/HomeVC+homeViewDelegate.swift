//
//  HomeVC+homeViewDelegate.swift
//  Weather App
//
//  Created by mohamed on 6/25/22.
//

import UIKit

extension HomeVC: HomeViewDelegate {
    
    func addNewCityBtn() {
        let searchVC = SearchVC()
        searchVC.homeDelegate = self
        self.present(searchVC, animated: true, completion: nil)
    }
    
    func didSelectCity(cityName: String) {
        let detailsModalVC = DetailsModalVC().create(cityName: cityName)
        self.present(detailsModalVC, animated: true, completion: nil)
    }
}
