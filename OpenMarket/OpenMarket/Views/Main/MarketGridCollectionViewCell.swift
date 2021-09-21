//
//  MarketGridCollectionViewCell.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/09/01.
//

import UIKit

class MarketGridCollectionViewCell: UICollectionViewCell {
    static let identifier = "MarketGridCell"
    
    private enum Style {
        enum ItemImageView {
            static let margin: UIEdgeInsets = .init(top: 10, left: 0, bottom: 0, right: 0)
            static let width: CGFloat = 4/10
            static let height: CGFloat = 4/10
        }
        
        enum ItemTitle {
            static let margin: UIEdgeInsets = .init(top: 15, left: 5, bottom: 0, right: -5)
        }
        
        enum ItemStock {
            static let margin: UIEdgeInsets = .init(top: 0, left: 0, bottom: -20, right: 0)
        }
        
        enum ItemDiscountPrice {
            static let margin: UIEdgeInsets = .init(top: 0, left: 0, bottom: -8, right: 0)
        }
        
        enum ItemPrice {
            static let margin: UIEdgeInsets = .init(top: 15, left: 0, bottom: -8, right: 0)
        }
    }
    
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
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let itemPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textColor = .systemGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let itemStock: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.textColor = .systemGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let itemDiscountPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textColor = .systemGray
        label.isHidden = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func configurateGridCell(data: Item) {
        self.contentView.layer.borderWidth = 2
        self.contentView.layer.cornerRadius = 15
        setConstraints()
        convertPriceFormat(currency: data.currency, price: data.price, discountPrice: data.discountPrice)
        convertStockFormat(stock: data.stock)
        downloadImage(data.thumbnails.first!)
        self.itemTitle.text = data.title
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        resetImageView()
        resetItemPrice()
        resetItemDiscountPrice()
        resetItemStock()
    }
    
    private func resetImageView() {
        self.itemImageView.image = nil
    }
    
    private func resetItemPrice() {
        self.itemPrice.attributedText = nil
        self.itemPrice.textColor = .systemGray
    }
    
    private func resetItemDiscountPrice() {
        self.itemDiscountPrice.isHidden = true
    }
    
    private func resetItemStock() {
        self.itemStock.text = nil
        self.itemStock.textColor = .systemGray
    }
    
    private func downloadImage(_ imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        DispatchQueue.global(qos: .background).async {
            if let image = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.itemImageView.image = UIImage(data: image)
                }
            }
        }
    }
    
    private func convertStockFormat(stock: UInt) {
        if stock == 0 {
            self.itemStock.textColor = .systemOrange
            self.itemStock.text = "품절"
        } else {
            self.itemStock.textColor = .systemGray
            self.itemStock.text = "잔여수량 : \(stock)"
        }
    }
    
    private func convertPriceFormat(currency: String, price: UInt, discountPrice: UInt?) {
        if let discountPrice = discountPrice {
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "\(currency) \(price)")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            self.itemPrice.textColor = .systemRed
            self.itemPrice.attributedText = attributeString
            self.itemDiscountPrice.isHidden = false
            self.itemDiscountPrice.text = "\(currency) " + String(discountPrice)
        } else {
            self.itemPrice.text = "\(currency) \(price)"
        }
    }
    
    private func setConstraints() {
        setItemImageViewConstraint()
        setItemTitleConstraint()
        setItemStockConstraint()
        setItemDiscountPriceConstraint()
        setItemPriceConstraint()
    }
    
    private func setItemImageViewConstraint() {
        self.contentView.addSubview(self.itemImageView)
        
        NSLayoutConstraint.activate([
            self.itemImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: Style.ItemImageView.margin.top),
            self.itemImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.itemImageView.widthAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: Style.ItemImageView.width),
            self.itemImageView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: Style.ItemImageView.height),
        ])
    }
    
    private func setItemTitleConstraint() {
        self.contentView.addSubview(self.itemTitle)
        
        NSLayoutConstraint.activate([
            self.itemTitle.leadingAnchor.constraint(equalTo: self.itemImageView.leadingAnchor, constant: Style.ItemTitle.margin.left),
            self.itemTitle.topAnchor.constraint(equalTo: self.itemImageView.bottomAnchor, constant: Style.ItemTitle.margin.top),
            self.itemTitle.trailingAnchor.constraint(equalTo: self.itemImageView.trailingAnchor, constant: Style.ItemTitle.margin.right)
        ])
    }
    
    private func setItemStockConstraint() {
        self.contentView.addSubview(self.itemStock)
        
        NSLayoutConstraint.activate([
            self.itemStock.leadingAnchor.constraint(equalTo: self.itemTitle.leadingAnchor),
            self.itemStock.trailingAnchor.constraint(equalTo: self.itemTitle.trailingAnchor),
            self.itemStock.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: Style.ItemStock.margin.bottom)
        ])
    }
    
    private func setItemDiscountPriceConstraint() {
        self.contentView.addSubview(self.itemDiscountPrice)
        
        NSLayoutConstraint.activate([
            self.itemDiscountPrice.leadingAnchor.constraint(equalTo: self.itemTitle.leadingAnchor),
            self.itemDiscountPrice.trailingAnchor.constraint(equalTo: self.itemTitle.trailingAnchor),
            self.itemDiscountPrice.bottomAnchor.constraint(equalTo: self.itemStock.topAnchor, constant: Style.ItemDiscountPrice.margin.bottom),
        ])
    }
    
    private func setItemPriceConstraint() {
        self.contentView.addSubview(self.itemPrice)
        
        NSLayoutConstraint.activate([
            self.itemPrice.leadingAnchor.constraint(equalTo: self.itemTitle.leadingAnchor),
            self.itemPrice.trailingAnchor.constraint(equalTo: self.itemTitle.trailingAnchor),
            self.itemPrice.bottomAnchor.constraint(equalTo: self.itemDiscountPrice.topAnchor, constant: Style.ItemPrice.margin.bottom),
        ])
    }
    
    
}
