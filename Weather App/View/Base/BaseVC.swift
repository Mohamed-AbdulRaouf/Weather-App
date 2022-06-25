//
//  BaseVC.swift
//  Weather App
//
//  Created by mohamed on 6/24/22.
//

import UIKit

class BaseVC<T: BaseView>: UIViewController {

    final var mainView = T()

    override func loadView() {
        super.loadView()
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
