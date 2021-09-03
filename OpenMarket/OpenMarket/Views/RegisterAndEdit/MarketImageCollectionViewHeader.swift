//
//  MarketImageCollectionViewHeader.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/09/02.
//

import UIKit

final class MarketImageCollectionViewHeader: UICollectionReusableView {
    static let identifier = "MarketImageHeader"
    
    private let imageAddButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        button.setTitle("➕", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func configrateHeader() {
        setImageAddButtonConstraint()
        setImageAddButton()
        self.backgroundColor = .white
    }
    
    private func setImageAddButton() {
        self.imageAddButton.addTarget(self, action: #selector(tappedAddButton), for: .touchUpInside)
    }
    
    @objc private func tappedAddButton() {
        NotificationCenter.default.post(name: NSNotification.Name("TapAddButton"), object: nil)
    }
    
    private func setImageAddButtonConstraint() {
        self.addSubview(self.imageAddButton)
        
        NSLayoutConstraint.activate([
            self.imageAddButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.imageAddButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.imageAddButton.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 6/10),
            self.imageAddButton.heightAnchor.constraint(equalTo: self.imageAddButton.widthAnchor)
        ])
    }
}
