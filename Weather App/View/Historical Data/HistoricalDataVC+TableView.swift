//
//  HistoricalDataVC+TableView.swift
//  Weather App
//
//  Created by mohamed on 6/26/22.
//

import UIKit

extension HistoricalDataVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.historicalData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
        cell.textLabel?.text = "\(self.viewModel.historicalData[indexPath.row].date)"
        cell.detailTextLabel?.text = "\(self.viewModel.historicalData[indexPath.row].weatherType) ∘\(self.viewModel.historicalData[indexPath.row].weatherDegree)"
        return cell
    }
}
