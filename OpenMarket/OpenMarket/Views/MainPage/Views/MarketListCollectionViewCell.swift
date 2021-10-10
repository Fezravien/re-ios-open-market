//
//  MarketListCollectionViewCell.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/08/28.
//

import UIKit

final class MarketListCollectionViewCell: UICollectionViewCell {
    static let identifier = "MarketListCell"
    
    // MARK: - UI Constraint Style
    
    private enum Style {
        enum ItemImageView {
            static let margin: UIEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 0)
            static let width: CGFloat = 3/10
            static let height: CGFloat = 3/10
        }
        
        enum ItemTitle {
            static let margin: UIEdgeInsets = .init(top: 15, left: 25, bottom: 0, right: -10)
        }
        
        enum ItemStock {
            static let margin: UIEdgeInsets = .init(top: 0, left: 0, bottom: -20, right: -10)
        }
        
        enum ItemPrice {
            static let margin: UIEdgeInsets = .init(top: 0, left: 0, bottom: -10, right: 0)
        }
        
        enum ItemDiscountPrice {
            static let margin: UIEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: -10)
        }
    }
    
    // MARK: - variable, constant and UI Initialization
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let itemTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = .black
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
    private let itemDiscountPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textColor = .systemGray
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let marketMainViewModel = MarketMainViewModel()
    weak var mainSceneDelegate: MainSceneDelegate?
    
    // MARK: - Data binding with ViewModel (MainViewModel)
    
    func configuarationCell(item : Item, indexPath: IndexPath) {
        bindData()
        setConstraints()
        self.marketMainViewModel.downloadThumbnail(item.thumbnails.first ?? "")
        self.marketMainViewModel.itemForCell(item: item)
    }
    
    private func bindData() {
        self.marketMainViewModel.bindThumbnailHandler {
            guard let thumbnail = self.marketMainViewModel.itemThumbnail,
                  let item = self.marketMainViewModel.marketItem else {
                      
                      return
                  }
            let convertedPrice = self.marketMainViewModel.convertPriceFormat(currency: item.currency, price: item.price, discountPrice: item.discountPrice)
            let convertedStock = self.marketMainViewModel.convertStockFormat(stock: item.stock)
            
            DispatchQueue.main.async {
                self.itemImageView.image = UIImage(data: thumbnail)
                self.itemTitle.text = item.title
                self.itemStock.text = convertedStock
                self.applyPriceFormat(priceFormat: convertedPrice)
                self.mainSceneDelegate?.stopIndicater()
            }
        }
    }
    
    private func applyPriceFormat(priceFormat: (String, NSMutableAttributedString?)) {
        let price = priceFormat.0
        
        if let attributedString = priceFormat.1 {
            self.itemPrice.textColor = .systemRed
            self.itemPrice.attributedText = attributedString
            self.itemDiscountPrice.isHidden = false
            self.itemDiscountPrice.text = price
        } else {
            self.itemPrice.text = price
        }
    }
    
    // MARK: - initialize UICollectionView Cell
    
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
    
    // MARK: - Set UICollectionView Cell Constraint
    
    private func setConstraints() {
        setItemImageViewConstraint()
        setItemTitleConstraint()
        setItemStockConstraint()
        setItemPriceConstraint()
        setItemDiscountPriceConstraint()
    }
    
    private func setItemImageViewConstraint() {
        self.contentView.addSubview(self.itemImageView)
        
        NSLayoutConstraint.activate([
            self.itemImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: Style.ItemImageView.margin.left),
            self.itemImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.itemImageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: Style.ItemImageView.width),
            self.itemImageView.heightAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: Style.ItemImageView.height),
        ])
    }
    
    private func setItemTitleConstraint() {
        self.contentView.addSubview(self.itemTitle)
        
        NSLayoutConstraint.activate([
            self.itemTitle.leadingAnchor.constraint(equalTo: self.itemImageView.trailingAnchor, constant: Style.ItemTitle.margin.left),
            self.itemTitle.topAnchor.constraint(equalTo: self.itemImageView.topAnchor, constant: Style.ItemTitle.margin.top),
            self.itemTitle.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: Style.ItemTitle.margin.right)
        ])
    }
    
    private func setItemStockConstraint() {
        self.contentView.addSubview(self.itemStock)
        
        NSLayoutConstraint.activate([
            self.itemStock.leadingAnchor.constraint(equalTo: self.itemTitle.leadingAnchor),
            self.itemStock.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: Style.ItemStock.margin.right),
            self.itemStock.bottomAnchor.constraint(equalTo: self.itemImageView.bottomAnchor, constant: Style.ItemStock.margin.bottom)
        ])
    }
    
    private func setItemPriceConstraint() {
        self.contentView.addSubview(self.itemPrice)
        
        NSLayoutConstraint.activate([
            self.itemPrice.leadingAnchor.constraint(equalTo: self.itemTitle.leadingAnchor),
            self.itemPrice.bottomAnchor.constraint(equalTo: self.itemStock.topAnchor, constant: Style.ItemPrice.margin.bottom),
        ])
    }
    
    private func setItemDiscountPriceConstraint() {
        self.contentView.addSubview(self.itemDiscountPrice)
        
        NSLayoutConstraint.activate([
            self.itemDiscountPrice.leadingAnchor.constraint(equalTo: self.itemPrice.trailingAnchor, constant: Style.ItemDiscountPrice.margin.left),
            self.itemDiscountPrice.bottomAnchor.constraint(equalTo: self.itemPrice.bottomAnchor),
            self.itemDiscountPrice.trailingAnchor.constraint(lessThanOrEqualTo: self.contentView.trailingAnchor, constant: Style.ItemDiscountPrice.margin.right)
        ])
    }
}
