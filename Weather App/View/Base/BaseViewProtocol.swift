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
    func showMessage(message: String)
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
    
    func showMessage(message: String) {
        showMessage(message: message)
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
    
    func showMessage(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert,
                     animated: true,
                     completion: nil)
    }
}
