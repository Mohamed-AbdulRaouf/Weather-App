//
//  HistoricalDataVC+historicalDataViewDelegate.swift
//  Weather App
//
//  Created by mohamed on 6/25/22.
//

import UIKit

extension HistoricalDataVC: HistoricalDataViewDelegate {
    func backToView() {
        self.dismiss(animated: true, completion: nil)
    }
}
