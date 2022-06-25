//
//  SearchVC.swift
//  Weather App
//
//  Created by mohamed on 6/25/22.
//

import UIKit

class SearchVC: BaseVC<SearchView> {


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = mainView.searchBar
        mainView.searchBar.delegate = self
    }
}

