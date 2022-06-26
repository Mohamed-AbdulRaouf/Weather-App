//
//  HomeVC.swift
//  Weather App
//
//  Created by mohamed on 6/24/22.
//

import UIKit

protocol HomeVCDelegate: AnyObject {
    func reloadData()
}

class HomeVC: BaseVC<HomeView> {
    
    var homeViewModel = HomeViewModel()
    weak var delegate: HomeVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel = HomeViewModel(controller: self)
        delegate = self
        mainView.delegate = self
        mainView.citiesTableView.delegate = self
        mainView.citiesTableView.dataSource = self
        fetchCities()
    }
    
    func fetchCities() {
        self.homeViewModel.fetchCities()
        self.mainView.citiesTableView.reloadData()
    }
}
