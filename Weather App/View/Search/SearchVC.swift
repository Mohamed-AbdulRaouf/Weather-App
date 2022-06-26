//
//  SearchVC.swift
//  Weather App
//
//  Created by mohamed on 6/25/22.
//

import UIKit

class SearchVC: BaseVC<SearchView> {
    
    let searchViewModel = SearchViewModel()
    var homeDelegate: HomeVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = mainView.searchBar
        mainView.searchBar.delegate = self
    }
    
    func searchByCity(_ cityName: String) {
        searchViewModel.getWeatherData(cityName: cityName) { data, error in
            if let _ = error {
                self.showMessage(message: "Please add a valid city")
            } else {
                guard let cityName = data?.name, let countryName = data?.sys?.country else { return }
                let name = "\(cityName), \(countryName)"
                CoreDataManager.shared.saveCityName(name)
                CoreDataManager.shared.saveHistoricalData(cityName: "\(cityName), \(data?.sys?.country ?? "")", weatherType: data?.weather?.first?.main ?? "", weatherDegree: data?.main?.temp ?? 0.0)
                self.closeSearch()
            }
        }
    }
    
    func closeSearch() {
        self.dismiss(animated: true) {
            self.homeDelegate?.reloadData()
        }
    }
}

