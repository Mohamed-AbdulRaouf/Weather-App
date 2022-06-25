//
//  CityTVCellView.swift
//  Weather App
//
//  Created by mohamed on 6/25/22.
//

import UIKit

@objc protocol CityCellDelegate: AnyObject {
    func selectCity()
}

class CityTVCellView: UITableViewCell {
    
    weak var delegate: CityCellDelegate?
    
    lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    lazy var viewMoreBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrow-righ"), for: .normal)
        button.addTarget(delegate, action: #selector(self.delegate?.selectCity), for: .touchUpInside)
        return button
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        contentView.addSubview(titleLbl)
        titleLbl.anchor(.leading(contentView.leadingAnchor, constant: 10),
                        .centerY(contentView.centerYAnchor, constant: 0))
        
        contentView.addSubview(viewMoreBtn)
        viewMoreBtn.anchor(.trailing(contentView.trailingAnchor, constant: 10),
                           .centerY(contentView.centerYAnchor, constant: 0))
    }
    
}
