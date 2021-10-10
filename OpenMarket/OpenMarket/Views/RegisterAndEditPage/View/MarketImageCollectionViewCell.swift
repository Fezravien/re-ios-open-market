//
//  MarketImageCollectionViewCell.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/09/02.
//

import UIKit

final class MarketImageCollectionViewCell: UICollectionViewCell {
    static let identifier = "MarketImageCell"
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func configurateImageCell(image: UIImage) {
        setItemImageViewConstraint()
        self.itemImageView.image = image
    }
    
    func setItemImageViewConstraint() {
        self.contentView.addSubview(self.itemImageView)
        
        NSLayoutConstraint.activate([
            self.itemImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.itemImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.itemImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.itemImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
}
