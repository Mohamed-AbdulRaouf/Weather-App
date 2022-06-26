//
//  DetailsModalVC+detailsModalViewDelegate.swift
//  Weather App
//
//  Created by mohamed on 6/25/22.
//

import UIKit

extension DetailsModalVC: DetailsModalViewDelegate {
    
    func closeView() {
        self.dismiss(animated: true, completion: nil)
    }
}
