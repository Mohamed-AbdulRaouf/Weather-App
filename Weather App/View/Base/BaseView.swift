//
//  BaseView.swift
//  Weather App
//
//  Created by mohamed on 6/24/22.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupAppearance() {
        if self.traitCollection.userInterfaceStyle == .dark {
            self.backgroundColor = .darkGray
        } else {
            self.backgroundColor = .lightGray
        }
    }
    
    func setupView() {}
}
