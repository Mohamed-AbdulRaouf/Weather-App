//
//  DetailsModalView.swift
//  Weather App
//
//  Created by mohamed on 6/25/22.
//

//
//  HistoricalDataView.swift
//  Weather App
//
//  Created by mohamed on 6/25/22.
//

import UIKit

@objc protocol DetailsModalViewDelegate: AnyObject {
    func closeView()
}

class DetailsModalView: BaseView {
    
    // MARK: - Variables
    weak var delegate: DetailsModalViewDelegate?
    lazy var scrollView: UIScrollView = { return UIScrollView() }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var headerLbl: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var closeBtn: UIButton = {
        let button = UIButton()
        button.setTitle("x", for: .normal)
        button.setBackgroundImage(UIImage(named: "Button_modal"), for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 25)
        button.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: 44,
            right: 30)
        button.addTarget(delegate, action: #selector(delegate?.closeView), for: .touchUpInside)
        return button
    }()
    
    lazy var centerPopupView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var cloudImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var descriptionLbl: UILabel = {
        let label = UILabel()
        label.text = "Description"
        return label
    }()
    
    lazy var descriptionValueLbl: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    lazy var descriptionStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .fillEqually
        stack.spacing = 25
        return stack
    }()
    
    lazy var temperatureLbl: UILabel = {
        let label = UILabel()
        label.text = "Temperature"
        return label
    }()
    
    lazy var temperatureValueLbl: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    lazy var temperatureStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .fillEqually
        stack.spacing = 25
        return stack
    }()
    
    lazy var humidityLbl: UILabel = {
        let label = UILabel()
        label.text = "Humidity"
        return label
    }()
    
    lazy var humidityValueLbl: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    lazy var humidityStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .equalCentering
        stack.spacing = 25
        return stack
    }()
    
    lazy var windspeedLbl: UILabel = {
        let label = UILabel()
        label.text = "Windspeed"
        return label
    }()
    
    lazy var windspeedValueLbl: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    lazy var windspeedStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.spacing = 25
        return stack
    }()
    
    lazy var mainDetailsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 10
        return stack
    }()
    
    
    lazy var bottomLbl: UILabel = {
        let label = UILabel()
        label.text = "Weather information for London received on"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Func
    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(headerLbl)
        containerView.addSubview(closeBtn)
        containerView.addSubview(centerPopupView)
        containerView.addSubview(cloudImage)
        containerView.addSubview(descriptionStack)
        descriptionStack.addArrangedSubview(descriptionLbl)
        descriptionStack.addArrangedSubview(descriptionValueLbl)
        containerView.addSubview(temperatureStack)
        temperatureStack.addArrangedSubview(temperatureLbl)
        temperatureStack.addArrangedSubview(temperatureValueLbl)
        containerView.addSubview(humidityStack)
        humidityStack.addArrangedSubview(humidityLbl)
        humidityStack.addArrangedSubview(humidityValueLbl)
        containerView.addSubview(windspeedStack)
        windspeedStack.addArrangedSubview(windspeedLbl)
        windspeedStack.addArrangedSubview(windspeedValueLbl)
        containerView.addSubview(mainDetailsStack)
        mainDetailsStack.addArrangedSubview(cloudImage)
        mainDetailsStack.addArrangedSubview(descriptionStack)
        mainDetailsStack.addArrangedSubview(temperatureStack)
        mainDetailsStack.addArrangedSubview(humidityStack)
        mainDetailsStack.addArrangedSubview(windspeedStack)
        centerPopupView.addSubview(mainDetailsStack)
        containerView.addSubview(bottomLbl)
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
        
        headerLbl.anchor(.top(containerView.topAnchor, constant: 0),
                         .centerX(containerView.centerXAnchor, constant: 0),
                         .height(44))
        closeBtn.anchor(.top(containerView.topAnchor, constant: 0),
                        .leading(containerView.leadingAnchor, constant: 0))
        
        centerPopupView.anchor(.top(headerLbl.bottomAnchor, constant: 100),
                               .leading(containerView.leadingAnchor, constant: 16),
                               .trailing(containerView.trailingAnchor, constant: 16),
                               .height(300))
        cloudImage.anchor(.height(90),
                          .width(120))
        mainDetailsStack.anchor(.centerX(centerPopupView.centerXAnchor, constant: 0),
                                .centerY(centerPopupView.centerYAnchor, constant: 0))
        bottomLbl.anchor(.bottom(containerView.bottomAnchor, constant: 40),
                         .leading(containerView.leadingAnchor, constant: 20),
                         .trailing(containerView.trailingAnchor, constant: 20))
    }
}
