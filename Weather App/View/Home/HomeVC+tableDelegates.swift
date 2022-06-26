//
//  HomeVC+tableDelegates.swift
//  Weather App
//
//  Created by mohamed on 6/25/22.
//

import UIKit

extension HomeVC: UITableViewDelegate, UITableViewDataSource, CityCellDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.homeViewModel.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityTVCellView.identifier, for: indexPath) as? CityTVCellView else {return UITableViewCell()}
        cell.backgroundColor = .clear
        cell.titleLbl.text = self.homeViewModel.cities[indexPath.row].uppercased()
        cell.viewMoreBtn.tag = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.mainView.delegate?.didSelectCity(cityName: self.homeViewModel.cities[indexPath.row])
    }
    
    func selectCity(_ sender: UIButton) {
        let cityName = self.homeViewModel.cities[sender.tag]
        let historicalDataVC = HistoricalDataVC().create(cityName: cityName)
        self.present(historicalDataVC, animated: true, completion: nil)
    }
}
