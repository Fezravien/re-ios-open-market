//
//  ViewController.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/09/05.
//

import UIKit

extension UIViewController {
    typealias AlertActionHandler = ((UIAlertAction) -> Void)
    
    func alert(title: String, message: String? = nil, okTitle: String = "OK") {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: okTitle, style: .cancel)
        alert.addAction(okAction)
    
        self.present(alert, animated: true)
    }
}
