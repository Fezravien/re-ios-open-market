//
//  MarketMainViewController.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/08/28.
//

import UIKit

final class MarketMainViewController: UIViewController, RegisterationToMainDelegate, DetailToMainDelegate {
    
    // MARK: - Name Space
    
    private enum segmentStyle: String, CaseIterable {
        case list = "List"
        case grid = "Grid"
    }
    
    private enum Mode {
        case normal
        case delete
    }
    
    // MARK: - variable, constant and UI Initialization
    
    private let itemListLoadingindicater: UIActivityIndicatorView = {
        let indicater = UIActivityIndicatorView(style: .large)
        indicater.color = .darkGray
        indicater.hidesWhenStopped = true
        indicater.translatesAutoresizingMaskIntoConstraints = false
        return indicater
    }()
    private let itemListModeSegmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: segmentStyle.allCases.map { $0.rawValue })
        segmentControl.selectedSegmentIndex = 0
        segmentControl.tintColor = .white
        segmentControl.backgroundColor = .systemOrange
        return segmentControl
    }()
    private let itemListCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(MarketListCollectionViewCell.self, forCellWithReuseIdentifier: MarketListCollectionViewCell.identifier)
        collectionView.register(MarketGridCollectionViewCell.self, forCellWithReuseIdentifier: MarketGridCollectionViewCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    private let marketMainViewModel = MarketMainViewModel()
    private var marketDetailViewController: MarketDetailViewController?
    private var page: UInt = 1
    private var mode: Mode = .normal
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItem()
        bindData()
        fetchMarketData()
        setSegment()
        setConstraint()
        setDelegate()
        setDataSource()
    }
    
    // MARK: - Data binding with ViewModel (MainViewModel)
    
    private func bindData() {
        self.marketMainViewModel.observer = {
            if self.marketMainViewModel.getMarketItemsCount == 0 {
                self.page = 1
                self.fetchMarketData()
                return
            }
            
            DispatchQueue.main.async {
                self.itemListLoadingindicater.startAnimating()
                self.itemListCollectionView.reloadData()
                if self.mode == .delete {
                    self.mode = .normal
                    self.itemListCollectionView.setContentOffset(CGPoint(x: 0, y: self.itemListCollectionView.contentInset.top), animated: true)
                }
                self.itemListLoadingindicater.stopAnimating()
            }
        }
    }
    
    // MARK: - Set dataSource and delegate at self
    
    private func setDataSource() {
        self.itemListCollectionView.dataSource = self
        self.itemListCollectionView.prefetchDataSource = self
    }
    
    private func setDelegate() {
        self.itemListCollectionView.delegate = self
    }
    
    // MARK: - Set UI configuration
    
    private func setNavigationItem() {
        self.navigationController?.view.backgroundColor = .systemGray3
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tappedRegisterAndEditItemButton))
    }
    
    @objc private func tappedRegisterAndEditItemButton() {
        let marketRegisterAndEditViewController = MarketRegisterAndEditViewController()
        marketRegisterAndEditViewController.registrationToMainDelegate = self
        marketRegisterAndEditViewController.setRegisterAndEditViewController(state: .registration)
        self.navigationController?.pushViewController(marketRegisterAndEditViewController, animated: true)
    }
    
    private func setSegment() {
        for index in 0..<segmentStyle.allCases.count {
            self.itemListModeSegmentControl.setWidth(self.view.frame.width * 1/5, forSegmentAt: index)
        }
        self.itemListModeSegmentControl.addTarget(self, action: #selector(changedSegmentController), for: .valueChanged)
        self.navigationItem.titleView = self.itemListModeSegmentControl
    }
    
    @objc private func changedSegmentController() {
        switch self.itemListModeSegmentControl.selectedSegmentIndex {
        case 0:
            self.itemListCollectionView.reloadData()
        case 1:
            self.itemListCollectionView.reloadData()
        default:
            return
        }
    }
    
    // MARK: - Set constraint UI
    
    private func setConstraint() {
        setMarketIndicaterConstraint()
        setMarketCollectionViewConstraint()
    }
    
    private func setMarketCollectionViewConstraint() {
        self.view.addSubview(self.itemListCollectionView)
        
        NSLayoutConstraint.activate([
            self.itemListCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.itemListCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.itemListCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.itemListCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
    private func setMarketIndicaterConstraint() {
        self.itemListCollectionView.addSubview(self.itemListLoadingindicater)
        
        NSLayoutConstraint.activate([
            self.itemListLoadingindicater.centerXAnchor.constraint(equalTo: self.itemListCollectionView.centerXAnchor),
            self.itemListLoadingindicater.centerYAnchor.constraint(equalTo: self.itemListCollectionView.centerYAnchor),
        ])
    }
    
    // MARK: - Fetch itmeList data from Server
    
    private func fetchMarketData(page: UInt = 1) {
        self.itemListLoadingindicater.startAnimating()
        guard let request = self.marketMainViewModel.createRequest(page) else { return }
    
        self.marketMainViewModel.fetch(request: request, decodeType: ItemList.self) { [weak self] _ in
            // TODO: - 실패 오류를 받아서 Alert로 사용자에게 알릴 수 있다.
            DispatchQueue.main.async {
                self?.itemListLoadingindicater.stopAnimating()
            }
        }
    }
    
    // MARK: - Get notifications from other objects. (Delegate Pattern)
    
    func refreshMainItemList() {
        self.mode = .delete
        self.marketMainViewModel.removeAllItems()
    }
    
    func displayRegisteratedItem(item: Item) {
        self.marketDetailViewController = MarketDetailViewController()
        self.navigationController?.pushViewController(self.marketDetailViewController ?? MarketDetailViewController(), animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.marketDetailViewController?.refreshDetailItem(item: item)
        }
    }
}

// MARK: - UICollectionView - DataSource

extension MarketMainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.marketMainViewModel.getMarketItemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch self.itemListModeSegmentControl.selectedSegmentIndex {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MarketListCollectionViewCell.identifier, for: indexPath) as? MarketListCollectionViewCell else { return UICollectionViewCell() }
            let item = self.marketMainViewModel.getMarketItem(index: indexPath.row)
            self.marketMainViewModel.downloadImage(item.thumbnails.first ?? "") { imageData in
                cell.configurateListCellImage(imageData: imageData)
            }
            cell.configurateListCellText(data: self.marketMainViewModel.getMarketItem(index: indexPath.row))
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MarketGridCollectionViewCell.identifier, for: indexPath) as? MarketGridCollectionViewCell else { return UICollectionViewCell() }
            let item = self.marketMainViewModel.getMarketItem(index: indexPath.row)
            self.marketMainViewModel.downloadImage(item.thumbnails.first ?? "") { imageData in
                cell.configurateGridCellImage(imageData: imageData)
            }
            cell.configurateGridCellText(data: self.marketMainViewModel.getMarketItem(index: indexPath.row))
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

// MARK: - UICollectionView - Delegate

extension MarketMainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.marketDetailViewController = MarketDetailViewController()
        self.marketDetailViewController?.detailToMainDelegate = self
        self.marketDetailViewController?.setDetailViewController(item: self.marketMainViewModel.getMarketItem(index: indexPath.row))
        self.navigationController?.pushViewController(self.marketDetailViewController ?? MarketDetailViewController(), animated: true)
    }
}

// MARK: - UICollectionView - FlowLayout

extension MarketMainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch self.itemListModeSegmentControl.selectedSegmentIndex {
        case 0:
            return CGSize(width: self.view.frame.width, height: self.view.frame.height * 1/6)
        case 1:
            return CGSize(width: (self.view.frame.width / 2) - 15, height: self.view.frame.height * 1/3)
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if self.itemListModeSegmentControl.selectedSegmentIndex == 1 {
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        } else {
            return UIEdgeInsets()
        }
    }
}

// MARK: - UICollecionView - Prefetching (Paging)

extension MarketMainViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if marketMainViewModel.getMarketItemsCount == indexPath.row + 2 {
                self.page += 1
                fetchMarketData(page: page)
            }
        }
    }
}
