//
//  DetailsModalVC.swift
//  Weather App
//
//  Created by mohamed on 6/25/22.
//

import UIKit

class DetailsModalVC: BaseVC<DetailsModalView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
    }
}
