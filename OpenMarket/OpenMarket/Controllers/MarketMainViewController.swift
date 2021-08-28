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
    
    private let marketSegmentController: UISegmentedControl = {
        let segmentController = UISegmentedControl(items: segmentStyle.allCases.map { $0.rawValue })
        segmentController.selectedSegmentIndex = 0
        segmentController.tintColor = .white
        segmentController.backgroundColor = .systemOrange
        return segmentController
    }()
    private let marketCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .darkGray
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSegment()
        setConstraint()
    }
    
    private func setSegment() {
        for index in 0..<segmentStyle.allCases.count {
            self.marketSegmentController.setWidth(self.view.frame.width * 1/5, forSegmentAt: index)
        }
        
        self.navigationItem.titleView = self.marketSegmentController
    }
    
    private func setConstraint() {
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
}
