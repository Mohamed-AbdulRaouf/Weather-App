//
//  SearchView.swift
//  Weather App
//
//  Created by mohamed on 6/25/22.
//

import UIKit

@objc protocol SearchViewDelegate: AnyObject {
    func addNewCityBtn()
    func didSelectCity()
}

class SearchView: BaseView {
    
    // MARK: - Variables
    weak var delegate: SearchViewDelegate?
    lazy var scrollView: UIScrollView = { return UIScrollView() }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var headerLbl: UILabel = {
        let label = UILabel()
        label.text = "Enter city, postcode or airoport location"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = "Search"
        searchBar.sizeToFit()
        searchBar.isTranslucent = true
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        searchBar.setShowsCancelButton(true, animated: true)
        return searchBar
    }()
    
    // MARK: - Func
    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(headerLbl)
        containerView.addSubview(searchBar)
    }
    
    override func setupView() {
        super.setupView()
        addSubviews()
        scrollView.anchor(.top(topAnchor, constant: 0),
                          .leading(leadingAnchor, constant: 0),
                          .trailing(trailingAnchor, constant: 0),
                          .bottom(bottomAnchor, constant: 0))
        containerView.anchor(.top(scrollView.topAnchor, constant: 0),
                             .leading(scrollView.leadingAnchor, constant: 0),
                             .trailing(scrollView.trailingAnchor, constant: 0),
                             .bottom(scrollView.bottomAnchor, constant: 0))
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1),
            containerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1)
        ])
        
        headerLbl.anchor(.top(containerView.topAnchor, constant: 10),
                         .centerX(containerView.centerXAnchor, constant: 0),
                         .height(18))
        searchBar.anchor(.top(headerLbl.bottomAnchor, constant: 10),
                         .trailing(containerView.trailingAnchor, constant: 0),
                         .leading(containerView.leadingAnchor, constant: 0),
                         .height(44))
    }
}
