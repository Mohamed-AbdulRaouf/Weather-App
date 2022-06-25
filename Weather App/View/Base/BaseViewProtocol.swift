//
//  BaseViewProtocol.swift
//  Weather App
//
//  Created by mohamed on 6/24/22.
//

import UIKit
import SVProgressHUD

protocol BaseViewProtocol: AnyObject {
    func startLoading(message: String?)
    func setLoadingMessage(message: String)
    func stopLoading()
}

extension BaseViewProtocol where Self: UIViewController {

    func startLoading(message: String? = nil) {
        startLoading(message: message)
    }

    func setLoadingMessage(message: String) {
        setLoadingMessage(message: message)
    }

    func stopLoading() {
        stopLoading()
    }
}

extension UIViewController {

    func startLoading(message: String? = nil) {
        SVProgressHUD.show(withStatus: message)
    }

    func setLoadingMessage(message: String) {
        SVProgressHUD.show(withStatus: message)
    }

    func stopLoading() {
        SVProgressHUD.dismiss()
    }

}
