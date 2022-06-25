//
//  HomeView.swift
//  Weather App
//
//  Created by mohamed on 6/24/22.
//

import UIKit

@objc protocol HomeViewDelegate: AnyObject {
    func addNewCityBtn()
    func didSelectCity()
}

class HomeView: BaseView {
    
    // MARK: - Variables
    weak var delegate: HomeViewDelegate?
    lazy var scrollView: UIScrollView = { return UIScrollView() }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var headerLbl: UILabel = {
        let label = UILabel()
        label.text = "Cities".uppercased()
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    lazy var addNewCityBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Button_right"), for: .normal)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 30)
        button.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: 36,
            bottom: 44,
            right: 0)
        button.addTarget(delegate, action: #selector(delegate?.addNewCityBtn), for: .touchUpInside)
        return button
    }()
    
    lazy var citiesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.register(CityTVCellView.self,
                           forCellReuseIdentifier: CityTVCellView.identifier)
        tableView.bounces = false
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Background")
        imageView.contentMode = .scaleAspectFill
        if self.traitCollection.userInterfaceStyle == .dark {
            imageView.backgroundColor = .darkGray
        } else {
            imageView.backgroundColor = .lightGray
        }
        return imageView
    }()
    
    // MARK: - Func
    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(backgroundImage)
        containerView.addSubview(headerLbl)
        containerView.addSubview(addNewCityBtn)
        containerView.addSubview(citiesTableView)
    }
    
    override func setupView() {
        super.setupView()
        addSubviews()
        scrollView.anchor(.top(topAnchor, constant: 0),
                          .leading(leadingAnchor, constant: 0),
                          .trailing(trailingAnchor, constant: 0),
                          .bottom(bottomAnchor, constant: 0))
        
        containerView.anchor(.top(scrollView.topAnchor, constant: 20),
                             .leading(scrollView.leadingAnchor, constant: 0),
                             .trailing(scrollView.trailingAnchor, constant: 0),
                             .bottom(scrollView.bottomAnchor, constant: 0))
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1),
            containerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1)
        ])
        headerLbl.anchor(.top(containerView.topAnchor, constant: 44),
                         .centerX(containerView.centerXAnchor, constant: 0),
                         .height(44))
        addNewCityBtn.anchor(.top(headerLbl.topAnchor , constant: -20),
                             .trailing(containerView.trailingAnchor, constant: 0))
        citiesTableView.anchor(.top(headerLbl.bottomAnchor, constant: 53),
                               .leading(containerView.leadingAnchor, constant: 16),
                               .trailing(containerView.trailingAnchor, constant: 16),
                               .bottom(containerView.bottomAnchor, constant: 0))
        backgroundImage.anchor(.bottom(containerView.bottomAnchor, constant: 0),
                               .leading(containerView.leadingAnchor, constant: 0),
                               .trailing(containerView.trailingAnchor, constant: 0))
    }
}
