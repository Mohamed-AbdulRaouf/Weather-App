//
//  HistoricalDataVC.swift
//  Weather App
//
//  Created by mohamed on 6/25/22.
//

import UIKit

class HistoricalDataVC: BaseVC<HistoricalDataView> {

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
    }
}

extension HistoricalDataVC: HistoricalDataViewDelegate {
    func backToView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
