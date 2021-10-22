//
//  MarketDetailViewController.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/09/18.
//

import UIKit

class MarketDetailViewController: UIViewController, UIGestureRecognizerDelegate, DetailSceneDelegate {
    
    private enum DetailPageMode {
        case editAndDelete
        case registered
    }
    
    // MARK: - variable, constant and UI Initialization
    
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
    private let indicater: UIActivityIndicatorView = {
        let indicater = UIActivityIndicatorView(style: .large)
        indicater.hidesWhenStopped = true
        indicater.translatesAutoresizingMaskIntoConstraints = false
        return indicater
    }()
    private let marketDetailViewModel = MarketDetailViewModel()
    private var displayMode: DetailPageMode = .editAndDelete
    private var registeredItem: Item?
    weak var updateDelegate: MainSceneDelegate?
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        addNavigationItem()
        setDelegate()
        bindData()
        setRegisteredItem()
    }
    
    // MARK: - Data binding with ViewModel (DetailViewModel)
    
    private func bindData() {
        self.marketDetailViewModel.bindDetailItem { [weak self] in
            guard let item = self?.marketDetailViewModel.detailItem,
                  let image = self?.marketDetailViewModel.itemImages else {
                      
                      return
                  }
            
            DispatchQueue.main.async {
                self?.updateItemText(item: item)
                self?.updateImage(image: image)
                self?.view.layoutIfNeeded()
            }
        }
    }
    
    private func updateItemText(item: Item) {
        let convertedPrice = self.marketDetailViewModel.convertPriceFormat(currency: item.currency, price: item.price, discountPrice: item.discountPrice)
        let convertedStock = self.marketDetailViewModel.convertStockFormat(stock: item.stock)
        
        self.navigationItem.title = item.title
        self.applyPriceFormat(priceFormat: convertedPrice)
        self.itemStock.text = convertedStock
        self.itemDescription.text = item.descriptions
        self.itemTitle.text = item.title
    }
    
    private func updateImage(image: [Data]) {
        for index in 0..<image.count {
            DispatchQueue.main.async {
                let imageView = UIImageView()
                imageView.contentMode = .scaleAspectFit
                let positionX = self.imageScrollView.frame.width * CGFloat(index)
                let positionY = self.imageScrollView.frame.origin.y
                imageView.frame = CGRect(x: positionX, y: positionY, width: self.imageScrollView.bounds.width, height: self.imageScrollView.bounds.height)
                imageView.image = UIImage(data: image[index])
                self.imageScrollView.addSubview(imageView)
                self.imageScrollView.contentSize.width = imageView.frame.width * CGFloat(index + 1)
            }
        }
        
        DispatchQueue.main.async {
            self.imageScrollViewPageControl.numberOfPages = image.count
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
    
    // MARK: - Set Delegate
    
    private func setDelegate() {
        self.imageScrollView.delegate = self
    }
    
    // MARK: - Set self Navigation
    
    private func addNavigationItem() {
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(tappedEditButton))
        self.navigationItem.rightBarButtonItem = editButton
    }
    
    @objc private func tappedEditButton() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "삭제", style: .destructive) { _ in
            self.alertInputPassword { password in
                self.indicater.startAnimating()
                let password = ItemDelete(password: password)
                guard let item = self.marketDetailViewModel.detailItem,
                      let request = self.marketDetailViewModel.createRequestForItemDelete(data: password, id: item.id) else {
                    
                    return
                }
                
                self.marketDetailViewModel.fetch(request: request, decodeType: Item.self) { item in
                    guard let _ = item else {
                        DispatchQueue.main.async {
                            self.indicater.stopAnimating()
                            self.alert(title: "비밀번호를 확인해주세요")
                        }
                        return
                    }
                    
                    DispatchQueue.main.async {
                        self.indicater.stopAnimating()
                        self.alert(title: "상품이 삭제되었습니다.") {
                            self.updateDelegate?.refreshMainItemList()
                            self.navigationController?.popViewController(animated: true)
                        }
                    }
                }
            }
        }
        let editAction = UIAlertAction(title: "수정", style: .default) { _ in
            self.alertInputPassword { password in
                self.indicater.startAnimating()
                guard let modifyItem = self.createModifyItemFormat(password: password),
                      let request = try? self.marketDetailViewModel.createRequestForItemPatch(id: self.marketDetailViewModel.detailItem!.id, item: modifyItem) else {
                    
                    return
                }
                
                self.marketDetailViewModel.fetch(request: request, decodeType: Item.self) { item in
                    guard let item = item else {
                        DispatchQueue.main.async {
                            self.indicater.stopAnimating()
                            self.alert(title: "비밀번호를 확인해주세요")
                        }
                        return
                    }
                    
                    DispatchQueue.main.async {
                        self.indicater.stopAnimating()
                        let marketRegisterAndEditViewController = MarketRegisterAndEditViewController()
                        self.navigationController?.pushViewController(marketRegisterAndEditViewController, animated: true)
                        marketRegisterAndEditViewController.setRegisterAndEditViewController(state: .edit, item: item)
                        marketRegisterAndEditViewController.modificationDelegate = self
                        
                    }
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
    
    // MARK: - Create edit format
    
    private func createModifyItemFormat(password: String) -> ItemModification? {
        guard let currentItem = self.marketDetailViewModel.detailItem else { return nil }
        let itemModifation = ItemModification(title: currentItem.title,
                                             descriptions: currentItem.descriptions,
                                             price: currentItem.price,
                                             currency: currentItem.currency,
                                             stock: currentItem.stock,
                                             discountedPrice: currentItem.discountPrice,
                                             images: self.marketDetailViewModel.itemImages,
                                             password: password)
        
        return itemModifation
    }
    
    // MARK: - Receive data from otherViewController
    
    func setDetailViewController(item: Item) {
        guard let request = self.marketDetailViewModel.createRequestForItemFetch(item.id) else { return }
        self.marketDetailViewModel.fetch(request: request, decodeType: Item.self) { item in
            guard let item = item else { return }
            self.marketDetailViewModel.refreshItem(item: item)
        }
    }
    
    func displayRegisteredItem(item: Item) {
        self.displayMode = .registered
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(tappedCloseButton))
        self.registeredItem = item
    }
    
    private func setRegisteredItem() {
        guard let item = self.registeredItem else { return }
        refreshDetailItem(item: item)
    }
    
    @objc private func tappedCloseButton() {
        self.navigationController?.popToRootViewController(animated: true)
        self.updateDelegate?.refreshMainItemList()
    }

    // MARK: - Delegate Pattern from other View or ViewController
    
    func refreshDetailItem(item: Item) {
        self.marketDetailViewModel.refreshItem(item: item)
        self.updateDelegate?.refreshMainItemList()
    }
    
    
    // MARK: - Set constraint UI
    
    private func setConstraints() {
        setDetailPageScrollViewConstraint()
        setImageScrollViewConstraint()
        setImageScrollPageControlConstraint()
        setItemTitleConstraint()
        setItemPriceConstraint()
        setItemDiscountPriceConstraint()
        setItemStockConstraint()
        setItemDescription()
        setIndicaterConstraint()
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
    
    private func setIndicaterConstraint() {
        self.view.addSubview(self.indicater)
        
        NSLayoutConstraint.activate([
            self.indicater.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.indicater.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}

// MARK: - Scroll View Delegate

extension MarketDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x / scrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }
    
    private func setPageControlSelectedPage(currentPage: Int) {
        self.imageScrollViewPageControl.currentPage = currentPage
    }
}
