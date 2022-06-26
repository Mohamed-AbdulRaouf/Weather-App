//
//  HomeVC+homeVCDelegate.swift
//  Weather App
//
//  Created by mohamed on 6/26/22.
//

import Foundation

extension HomeVC: HomeVCDelegate {
    func reloadData() {
        self.fetchCities()
    }
}
