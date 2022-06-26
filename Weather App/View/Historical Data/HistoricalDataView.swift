//
//  HistoricalDataView.swift
//  Weather App
//
//  Created by mohamed on 6/25/22.
//

import UIKit

@objc protocol HistoricalDataViewDelegate: AnyObject {
    func backToView()
}

class HistoricalDataView: BaseView {
    
    // MARK: - Variables
    weak var delegate: HistoricalDataViewDelegate?
    lazy var scrollView: UIScrollView = { return UIScrollView() }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var headerLbl: UILabel = {
        let label = UILabel()
        label.text = "London\nhistorical".uppercased()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var headerLeftBtn: UIButton = {
        let button = UIButton()
        button.setTitle("←", for: .normal)
        button.setBackgroundImage(UIImage(named: "Button_right"), for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 25)
        button.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: 36,
            bottom: 44,
            right: 0)
        button.addTarget(delegate, action: #selector(delegate?.backToView), for: .touchUpInside)
        return button
    }()
    
    lazy var HistoricalTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    
    
    // MARK: - Func
    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(headerLbl)
        containerView.addSubview(headerLeftBtn)
        containerView.addSubview(HistoricalTableView)
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
        
        headerLbl.anchor(.top(containerView.topAnchor, constant: 44),
                         .centerX(containerView.centerXAnchor, constant: 0))
        headerLeftBtn.anchor(.top(headerLbl.topAnchor, constant: -2),
                             .trailing(containerView.trailingAnchor, constant: 0))
        HistoricalTableView.anchor(.top(headerLbl.bottomAnchor, constant: 53),
                                   .leading(containerView.leadingAnchor, constant: 16),
                                   .trailing(containerView.trailingAnchor, constant: 16),
                                   .bottom(containerView.bottomAnchor, constant: 0))
    }
}
