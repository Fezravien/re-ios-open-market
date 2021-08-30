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
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    private let marketViewModel = MarketViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
    
    private func setDelegate() {
        self.marketCollectionView.delegate = self
    }
    
    private func setSegment() {
        for index in 0..<segmentStyle.allCases.count {
            self.marketSegmentController.setWidth(self.view.frame.width * 1/5, forSegmentAt: index)
        }
        
        self.navigationItem.titleView = self.marketSegmentController
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
    
    private func fetchMarketData() {
        self.marketindicater.startAnimating()
        guard let fetchURL = NetworkConstant.itemList(page: 1).url else { return }
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
        return self.marketViewModel.marketItemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MarketListCollectionViewCell.identifier, for: indexPath) as? MarketListCollectionViewCell else { return UICollectionViewCell() }
        cell.listCellConfiguration(data: marketViewModel.marketItem(index: indexPath.row))
        return cell
    }
}

extension MarketMainViewController: UICollectionViewDelegate {
    
}
