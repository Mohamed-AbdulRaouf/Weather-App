//
//  HomeVC.swift
//  Weather App
//
//  Created by mohamed on 6/24/22.
//

import UIKit

class HomeVC: BaseVC<HomeView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
        mainView.citiesTableView.delegate = self
        mainView.citiesTableView.dataSource = self
    }
}
