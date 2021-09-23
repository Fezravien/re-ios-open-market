//
//  MarketDetailViewController.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/09/18.
//

import UIKit

class MarketDetailViewController: UIViewController, UIGestureRecognizerDelegate, Refreshable {
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
    lazy var marketRegisterAndEditViewController = MarketRegisterAndEditViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        addNavigationItem()
        setDelegate()
        bindDataDetailItem()
        bindDataImage()
    }
    
    private func addNavigationItem() {
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(tappedEditButton))
        self.navigationItem.rightBarButtonItem = editButton
    }
    
    @objc private func tappedEditButton() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "삭제", style: .destructive) { _ in
            
        }
        let editAction = UIAlertAction(title: "수정", style: .default) { _ in
            self.alertInputPassword { password in
                guard let modifyItem = self.createModifyItemFormat(password: password) else { return }
                do {
                    guard let request = try self.marketDetailViewModel.createRequestForItemPatch(id: self.marketDetailViewModel.getDetailItem()!.id, item: modifyItem) else { return }
                    self.marketDetailViewModel.patch(request: request) { result in
                        switch result {
                        case .success(_):
                            DispatchQueue.main.async {
                                self.marketRegisterAndEditViewController.setRegisterAndEditViewController(state: .edit, item: self.marketDetailViewModel.getDetailItem())
                                self.navigationController?.pushViewController(self.marketRegisterAndEditViewController, animated: true)
                            }
                        case .failure(_):
                            DispatchQueue.main.async {
                                self.alert(title: "비밀번호가 틀립니다.")
                            }
                        }
                    }
                } catch {
                    
                }
            }
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        alert.addAction(editAction)
        
        self.present(alert, animated: true) {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
            self.view.addGestureRecognizer(tapGesture)
        }
    }
    
    @objc func dismissAlertController(){
        self.dismiss(animated: true, completion: nil)
    }
    
    private func createModifyItemFormat(password: String) -> ItemModifcation? {
        guard let currentItem = self.marketDetailViewModel.getDetailItem() else { return nil }
        let itemModifation = ItemModifcation(title: currentItem.title,
                                             descriptions: currentItem.descriptions,
                                             price: currentItem.price,
                                             currency: currentItem.currency,
                                             stock: currentItem.stock,
                                             discountedPrice: currentItem.discountPrice,
                                             images: self.marketDetailViewModel.getImageDatas(),
                                             password: password)
        
        return itemModifation
    }
    
    private func setDelegate() {
        self.imageScrollView.delegate = self
        self.marketRegisterAndEditViewController.refreshDelegate = self
    }
    
    private func setPageControlSelectedPage(currentPage: Int) {
        self.imageScrollViewPageControl.currentPage = currentPage
    }
    
    private func bindDataDetailItem() {
        self.marketDetailViewModel.detailItemObserver = { [weak self] in
            guard let self = self else { return }
            guard let data = self.marketDetailViewModel.getDetailItem() else { return }
            DispatchQueue.main.async {
                self.convertPriceFormat(currency: data.currency, price: data.price, discountPrice: data.discountPrice)
                self.convertStockFormat(stock: data.stock)
                self.itemDescription.text = data.descriptions
                self.itemTitle.text = data.title
                self.loadViewIfNeeded()
            }
        }
    }
    
    private func bindDataImage() {
        self.marketDetailViewModel.itemImagesObserver = { [weak self] in
            guard let self = self else { return }
            for index in 0..<self.marketDetailViewModel.getImageCount {
                DispatchQueue.main.async {
                    let imageView = UIImageView()
                    imageView.contentMode = .scaleAspectFit
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
        guard let request = self.marketDetailViewModel.createRequestForItemFetch(item.id) else { return }
        self.marketDetailViewModel.fetch(request: request, decodeType: Item.self) { result in
            switch result {
            case .success(let judge):
                if judge {
                    DispatchQueue.main.async {
                        self.navigationItem.title = self.marketDetailViewModel.getDetailItem()?.title
                    }
                }
            case .failure(let error):
                self.alert(title: MarketModelError.network(error).description)
            }
        }
    }
    
    func refreshitem() {
        guard let item = self.marketDetailViewModel.getDetailItem() else { return }
        setDetailViewController(item: item)
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
