//
//  SearchVC+searchBarDelegate.swift
//  Weather App
//
//  Created by mohamed on 6/25/22.
//

import UIKit

extension SearchVC: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text == "" || searchBar.text == " " || searchBar.text == nil {
            self.showMessage(message: "Please add city name")
            return
        }
        self.searchByCity(searchBar.text ?? "")
    }
}
