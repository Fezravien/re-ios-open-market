//
//  MarketDetailViewController.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/09/18.
//

import UIKit

class MarketDetailViewController: UIViewController {
    private let detailPageScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    private let imageScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    private let imageScrollViewPageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .systemOrange
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    private let itemTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let itemPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
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
    private let itemStock: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let itemDescription: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let marketDetailViewModel = MarketDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        setDelegate()
        bindDataDetailItem()
        bindDataImage()
    }
    
    private func setDelegate() {
        self.imageScrollView.delegate = self
    }
    
    private func setPageControlSelectedPage(currentPage: Int) {
        self.imageScrollViewPageControl.currentPage = currentPage
    }
    
    private func bindDataDetailItem() {
        self.marketDetailViewModel.detailItemObserver = {
            guard let data = self.marketDetailViewModel.getDetailItem() else { return }
            DispatchQueue.main.async {
                self.convertPriceFormat(currency: data.currency, price: data.price, discountPrice: data.discountPrice)
                self.convertStockFormat(stock: data.stock)
                self.itemDescription.text = data.descriptions
                self.itemTitle.text = data.title
            }
        }
    }
    
    private func bindDataImage() {
        self.marketDetailViewModel.itemImagesObserver = {
            for index in 0..<self.marketDetailViewModel.getImageCount {
                DispatchQueue.main.async {
                    let imageView = UIImageView()
                    let positionX = self.imageScrollView.frame.width * CGFloat(index)
                    let positionY = self.imageScrollView.frame.origin.y
                    imageView.frame = CGRect(x: positionX, y: positionY, width: self.imageScrollView.bounds.width, height: self.imageScrollView.bounds.height)
                    imageView.image = UIImage(data: self.marketDetailViewModel.getImageData(index: index))
                    self.imageScrollView.addSubview(imageView)
                    self.imageScrollView.contentSize.width = imageView.frame.width * CGFloat(index + 1)
                }
            }
            
            DispatchQueue.main.async {
                self.imageScrollViewPageControl.numberOfPages = self.marketDetailViewModel.getImageCount
            }
        }
    }
    
    func setDetailViewController(item: Item) {
        guard let request = self.marketDetailViewModel.createRequest(item.id) else { return }
        self.navigationItem.title = item.title
        self.marketDetailViewModel.fetch(request: request, decodeType: Item.self) { result in
            switch result {
            case .success(let judge):
                if judge {
                    // TODO: - 데이터 Fetch 성공후 어떠한 작업이 필요하다면 ...
                }
            case .failure(let error):
                self.alert(title: MarketModelError.network(error).description)
            }
        }
    }
    
    private func convertPriceFormat(currency: String, price: UInt, discountPrice: UInt?) {
        if let discountPrice = discountPrice {
            let attributeString = NSMutableAttributedString(string: "\(currency) \(price)")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            self.itemPrice.textColor = .systemRed
            self.itemPrice.attributedText = attributeString
            self.itemDiscountPrice.isHidden = false
            self.itemDiscountPrice.text = "\(currency) " + String(discountPrice)
        } else {
            self.itemPrice.text = "\(currency) \(price)"
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
    
    private func setConstraints() {
        setDetailPageScrollViewConstraint()
        setImageScrollViewConstraint()
        setImageScrollPageControlConstraint()
        setItemTitleConstraint()
        setItemPriceConstraint()
        setItemDiscountPriceConstraint()
        setItemStockConstraint()
        setItemDescription()
    }
    
    private func setDetailPageScrollViewConstraint() {
        self.view.addSubview(self.detailPageScrollView)
        
        NSLayoutConstraint.activate([
            self.detailPageScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.detailPageScrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.detailPageScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.detailPageScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.detailPageScrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
    }
    
    private func setImageScrollViewConstraint() {
        self.detailPageScrollView.addSubview(self.imageScrollView)
        
        NSLayoutConstraint.activate([
            self.imageScrollView.leadingAnchor.constraint(equalTo: self.detailPageScrollView.leadingAnchor),
            self.imageScrollView.topAnchor.constraint(equalTo: self.detailPageScrollView.topAnchor),
            self.imageScrollView.leadingAnchor.constraint(equalTo: self.detailPageScrollView.trailingAnchor),
            self.imageScrollView.heightAnchor.constraint(equalTo: self.detailPageScrollView.widthAnchor),
        ])
    }
    
    private func setImageScrollPageControlConstraint() {
        self.detailPageScrollView.addSubview(self.imageScrollViewPageControl)

        NSLayoutConstraint.activate([
            self.imageScrollViewPageControl.centerXAnchor.constraint(equalTo: self.imageScrollView.centerXAnchor),
            self.imageScrollViewPageControl.bottomAnchor.constraint(equalTo: self.imageScrollView.bottomAnchor, constant: -10)
        ])
    }
    
    private func setItemTitleConstraint() {
        self.detailPageScrollView.addSubview(self.itemTitle)
        
        NSLayoutConstraint.activate([
            self.itemTitle.leadingAnchor.constraint(equalTo: self.imageScrollView.leadingAnchor, constant: 10),
            self.itemTitle.topAnchor.constraint(equalTo: self.imageScrollView.bottomAnchor, constant: 15),
            self.itemTitle.trailingAnchor.constraint(equalTo: self.imageScrollView.trailingAnchor, constant: -10),
            self.itemTitle.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -20)
        ])
    }
    
    private func setItemPriceConstraint() {
        self.detailPageScrollView.addSubview(self.itemPrice)
        
        NSLayoutConstraint.activate([
            self.itemPrice.leadingAnchor.constraint(equalTo: self.imageScrollView.leadingAnchor, constant: 10),
            self.itemPrice.topAnchor.constraint(equalTo: self.itemTitle.bottomAnchor, constant: 8),
            self.itemPrice.trailingAnchor.constraint(equalTo: self.imageScrollView.trailingAnchor, constant: -10),
            self.itemPrice.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -20)
        ])
    }
    
    private func setItemDiscountPriceConstraint() {
        self.detailPageScrollView.addSubview(self.itemDiscountPrice)
        
        NSLayoutConstraint.activate([
            self.itemDiscountPrice.leadingAnchor.constraint(equalTo: self.imageScrollView.leadingAnchor, constant: 10),
            self.itemDiscountPrice.topAnchor.constraint(equalTo: self.itemPrice.bottomAnchor, constant: 5),
            self.itemDiscountPrice.trailingAnchor.constraint(equalTo: self.imageScrollView.trailingAnchor, constant: -10),
            self.itemDiscountPrice.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -20)
        ])
    }
    
    private func setItemStockConstraint() {
        self.detailPageScrollView.addSubview(self.itemStock)
        
        NSLayoutConstraint.activate([
            self.itemStock.leadingAnchor.constraint(equalTo: self.imageScrollView.leadingAnchor, constant: 10),
            self.itemStock.topAnchor.constraint(equalTo: self.itemDiscountPrice.bottomAnchor, constant: 8),
            self.itemStock.trailingAnchor.constraint(equalTo: self.imageScrollView.trailingAnchor, constant: -10),
            self.itemStock.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -20)
        ])
    }
    
    private func setItemDescription() {
        self.detailPageScrollView.addSubview(self.itemDescription)
        
        NSLayoutConstraint.activate([
            self.itemDescription.leadingAnchor.constraint(equalTo: self.imageScrollView.leadingAnchor, constant: 10),
            self.itemDescription.topAnchor.constraint(equalTo: self.itemStock.bottomAnchor, constant: 10),
            self.itemDescription.trailingAnchor.constraint(equalTo: self.imageScrollView.trailingAnchor, constant: -10),
            self.itemDescription.bottomAnchor.constraint(equalTo: self.detailPageScrollView.bottomAnchor),
            self.itemDescription.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -20)
        ])
    }
}

extension MarketDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x / scrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }
}
