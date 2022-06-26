//
//  HistoricalDataVC.swift
//  Weather App
//
//  Created by mohamed on 6/25/22.
//

import UIKit

class HistoricalDataVC: BaseVC<HistoricalDataView> {
    
    var viewModel = HistoricalDataViewModel()
    var cityName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HistoricalDataViewModel(controller: self)
        mainView.delegate = self
        mainView.HistoricalTableView.delegate = self
        mainView.HistoricalTableView.dataSource = self
        self.viewModel.featchData(cityName: self.cityName ?? "")
    }
    
    func reloadData() {
        mainView.HistoricalTableView.reloadData()
    }
}
