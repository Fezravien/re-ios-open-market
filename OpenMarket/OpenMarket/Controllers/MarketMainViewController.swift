//
//  MarketMainViewController.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/08/28.
//

import UIKit

final class MarketMainViewController: UIViewController {

    private enum segmentStyle: String, CaseIterable {
        case list = "List"
        case grid = "Grid"
    }
    
    private let marketindicater: UIActivityIndicatorView = {
        let indicater = UIActivityIndicatorView(style: .large)
        indicater.color = .darkGray
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
    private var page = 1
    
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
            DispatchQueue.main.async {
                self.marketCollectionView.reloadData()
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
        let viewController = MarketRegisterAndEditViewController()
        viewController.setRegisterAndEditViewController(state: .registration)
        self.navigationController?.pushViewController(viewController, animated: true)
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
    
    private func fetchMarketData(page: Int = 1) {
        self.marketindicater.startAnimating()
        guard let fetchURL = NetworkConstant.itemList(page: page).url else { return }
        let request = URLRequest(url: fetchURL)
    
        self.marketViewModel.fetch(request: request, decodeType: ItemList.self) { [weak self] result in
            DispatchQueue.main.async {
                self?.marketindicater.stopAnimating()
            }
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
