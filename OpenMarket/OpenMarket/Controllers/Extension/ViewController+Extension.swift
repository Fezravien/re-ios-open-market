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
    
    func alertInputPassword(completion: @escaping (String) -> ()) {
        var textField = UITextField()
        let alert: UIAlertController = UIAlertController(title: "비밀번호를 입력해주세요.", message: nil, preferredStyle: .alert)
        alert.addTextField { alterTextField in
            alterTextField.placeholder = "비밀번호"
            textField = alterTextField
        }
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in
            completion(textField.text!)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
