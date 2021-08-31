//
//  MarketListCollectionViewCell.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/08/28.
//

import UIKit

class MarketListCollectionViewCell: UICollectionViewCell {
    static let identifier = "MarketListCell"
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let itemTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let itemPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let itemStock: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func listCellConfiguration(data: Item) {
        setConstraints()
        self.itemImageView.image = UIImage(data: downloadImage(data.thumbnails.first!))
        self.itemTitle.text = data.title
        self.itemStock.text = convertStockFormat(stock: data.stock)
        self.itemPrice.text = convertPriceFormat(currency: data.currency, price: data.price)
    }
    
    private func downloadImage(_ imageURL: String) -> Data {
        guard let url = URL(string: imageURL),
              let image = try? Data(contentsOf: url) else {
            
            // TODO: - 오류처리를 통해 이미지가 없다고 판단하도록 할 수 있을듯
            return Data()
        }
        
        return image
    }
    
    private func convertStockFormat(stock: UInt) -> String {
        return "잔여수량 : \(stock)"
    }
    
    private func convertPriceFormat(currency: String, price: UInt) -> String {
        return "\(currency) \(price)"
    }
    
    private func setConstraints() {
        setItemImageViewConstraint()
        setItemTitleConstraint()
        setItemStockConstraint()
        setItemPriceConstraint()
    }
    
    private func setItemImageViewConstraint() {
        self.contentView.addSubview(self.itemImageView)
        
        NSLayoutConstraint.activate([
            self.itemImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.itemImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.itemImageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 3/10),
            self.itemImageView.heightAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 3/10),
        ])
    }
    
    private func setItemTitleConstraint() {
        self.contentView.addSubview(self.itemTitle)
        
        NSLayoutConstraint.activate([
            self.itemTitle.leadingAnchor.constraint(equalTo: self.itemImageView.trailingAnchor, constant: 25),
            self.itemTitle.topAnchor.constraint(equalTo: self.itemImageView.topAnchor, constant: 15),
            self.itemTitle.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10)
        ])
    }
    
    private func setItemStockConstraint() {
        self.contentView.addSubview(self.itemStock)
        
        NSLayoutConstraint.activate([
            self.itemStock.leadingAnchor.constraint(equalTo: self.itemTitle.leadingAnchor),
            self.itemStock.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            self.itemStock.bottomAnchor.constraint(equalTo: self.itemImageView.bottomAnchor, constant: -20)
        ])
    }
    
    private func setItemPriceConstraint() {
        self.contentView.addSubview(self.itemPrice)
        
        NSLayoutConstraint.activate([
            self.itemPrice.leadingAnchor.constraint(equalTo: self.itemTitle.leadingAnchor),
            self.itemPrice.bottomAnchor.constraint(equalTo: self.itemStock.topAnchor, constant: -10),
            self.itemPrice.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
        ])
    }
}
