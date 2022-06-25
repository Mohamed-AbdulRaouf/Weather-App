//
//  HomeVC+tableDelegates.swift
//  Weather App
//
//  Created by mohamed on 6/25/22.
//

import UIKit

extension HomeVC: UITableViewDelegate, UITableViewDataSource, CityCellDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityTVCellView.identifier, for: indexPath) as? CityTVCellView
        cell?.backgroundColor = .clear
        cell?.titleLbl.text = "Hello, world".uppercased()
        cell?.delegate = self
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.mainView.delegate?.didSelectCity()
    }
    
    func selectCity() {
        let historicalDataVC = HistoricalDataVC()
        self.present(historicalDataVC, animated: true, completion: nil)
    }
}
