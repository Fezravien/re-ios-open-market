//
//  MarketMainViewController.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/08/28.
//

import UIKit

final class MarketMainViewController: UIViewController, RegisterationToMainDelegate, DetailToMainDelegate {
    private enum segmentStyle: String, CaseIterable {
        case list = "List"
        case grid = "Grid"
    }
    
    private enum Mode {
        case normal
        case delete
    }
    
    private let marketindicater: UIActivityIndicatorView = {
        let indicater = UIActivityIndicatorView(style: .large)
        indicater.color = .darkGray
        indicater.hidesWhenStopped = true
        indicater.translatesAutoresizingMaskIntoConstraints = false
        return indicater
    }()
    private let marketSegmentController: UISegmentedControl = {
        let segmentController = UISegmentedControl(items: segmentStyle.allCases.map { $0.rawValue })
        segmentController.selectedSegmentIndex = 0
        segmentController.tintColor = .white
        segmentController.backgroundColor = .systemOrange
        return segmentController
    }()
    private let marketCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(MarketListCollectionViewCell.self, forCellWithReuseIdentifier: MarketListCollectionViewCell.identifier)
        collectionView.register(MarketGridCollectionViewCell.self, forCellWithReuseIdentifier: MarketGridCollectionViewCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    private let marketViewModel = MarketMainViewModel()
    private var marketDetailViewController: MarketDetailViewController?
    private var page: UInt = 1
    private var mode: Mode = .normal
    
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
    
    private func bindData() {
        self.marketViewModel.observer = {
            if self.marketViewModel.getMarketItemsCount == 0 {
                self.page = 1
                self.fetchMarketData()
                return
            }
            
            DispatchQueue.main.async {
                self.marketindicater.startAnimating()
                self.marketCollectionView.reloadData()
                if self.mode == .delete {
                    self.mode = .normal
                    self.marketCollectionView.setContentOffset(CGPoint(x: 0, y: self.marketCollectionView.contentInset.top), animated: true)
                }
                self.marketindicater.stopAnimating()
            }
        }
    }
    
    private func setDataSource() {
        self.marketCollectionView.dataSource = self
        self.marketCollectionView.prefetchDataSource = self
    }
    
    private func setDelegate() {
        self.marketCollectionView.delegate = self
    }
    
    private func setSegment() {
        for index in 0..<segmentStyle.allCases.count {
            self.marketSegmentController.setWidth(self.view.frame.width * 1/5, forSegmentAt: index)
        }
        self.marketSegmentController.addTarget(self, action: #selector(changedSegmentController), for: .valueChanged)
        self.navigationItem.titleView = self.marketSegmentController
    }
    
    @objc private func changedSegmentController() {
        switch self.marketSegmentController.selectedSegmentIndex {
        case 0:
            self.marketCollectionView.reloadData()
        case 1:
            self.marketCollectionView.reloadData()
        default:
            return
        }
    }
    
    private func setNavigationItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tappedRegisterAndEditItemButton))
    }
    
    @objc private func tappedRegisterAndEditItemButton() {
        let marketRegisterAndEditViewController = MarketRegisterAndEditViewController()
        marketRegisterAndEditViewController.registrationToMainDelegate = self
        marketRegisterAndEditViewController.setRegisterAndEditViewController(state: .registration)
        self.navigationController?.pushViewController(marketRegisterAndEditViewController, animated: true)
    }
    
    private func setConstraint() {
        setMarketIndicaterConstraint()
        setMarketCollectionViewConstraint()
    }
    
    private func setMarketCollectionViewConstraint() {
        self.view.addSubview(self.marketCollectionView)
        
        NSLayoutConstraint.activate([
            self.marketCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.marketCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.marketCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.marketCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
    private func setMarketIndicaterConstraint() {
        self.marketCollectionView.addSubview(self.marketindicater)
        
        NSLayoutConstraint.activate([
            self.marketindicater.centerXAnchor.constraint(equalTo: self.marketCollectionView.centerXAnchor),
            self.marketindicater.centerYAnchor.constraint(equalTo: self.marketCollectionView.centerYAnchor),
        ])
    }
    
    private func fetchMarketData(page: UInt = 1) {
        self.marketindicater.startAnimating()
        guard let request = self.marketViewModel.createRequest(page) else { return }
    
        self.marketViewModel.fetch(request: request, decodeType: ItemList.self) { [weak self] _ in
            // TODO: - 실패 오류를 받아서 Alert로 사용자에게 알릴 수 있다.
            DispatchQueue.main.async {
                self?.marketindicater.stopAnimating()
            }
        }
    }
    
    func refreshMainItemList() {
        self.mode = .delete
        self.marketViewModel.removeAllItems()
    }
    
    func displayRegisteratedItem(item: Item) {
        self.marketDetailViewController = MarketDetailViewController()
        self.navigationController?.pushViewController(self.marketDetailViewController ?? MarketDetailViewController(), animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.marketDetailViewController?.refreshDetailItem(item: item)
        }
    }
}

extension MarketMainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.marketViewModel.getMarketItemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch self.marketSegmentController.selectedSegmentIndex {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MarketListCollectionViewCell.identifier, for: indexPath) as? MarketListCollectionViewCell else { return UICollectionViewCell() }
            
            cell.configurateListCell(data: marketViewModel.getMarketItem(index: indexPath.row))
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MarketGridCollectionViewCell.identifier, for: indexPath) as? MarketGridCollectionViewCell else { return UICollectionViewCell() }
            
            cell.configurateGridCell(data: marketViewModel.getMarketItem(index: indexPath.row))
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

extension MarketMainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.marketDetailViewController = MarketDetailViewController()
        self.marketDetailViewController?.detailToMainDelegate = self
        self.marketDetailViewController?.setDetailViewController(item: self.marketViewModel.getMarketItem(index: indexPath.row))
        self.navigationController?.pushViewController(self.marketDetailViewController ?? MarketDetailViewController(), animated: true)
    }
}

extension MarketMainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch self.marketSegmentController.selectedSegmentIndex {
        case 0:
            return CGSize(width: self.view.frame.width, height: self.view.frame.height * 1/6)
        case 1:
            return CGSize(width: (self.view.frame.width / 2) - 15, height: self.view.frame.height * 1/3)
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if self.marketSegmentController.selectedSegmentIndex == 1 {
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        } else {
            return UIEdgeInsets()
        }
    }
}

extension MarketMainViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if marketViewModel.getMarketItemsCount == indexPath.row + 2 {
                self.page += 1
                fetchMarketData(page: page)
            }
        }
    }
}
