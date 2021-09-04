//
//  MarketRegisterAndEditViewController.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/09/02.
//

import UIKit
import PhotosUI
import Photos

final class MarketRegisterAndEditViewController: UIViewController {

    enum State: String {
        case registration = "상품등록"
        case edit = "상품수정"
    }
    
    private let imageCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(MarketImageCollectionViewCell.self, forCellWithReuseIdentifier: MarketImageCollectionViewCell.identifier)
        collectionView.register(MarketImageCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MarketImageCollectionViewHeader.identifier)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    private let itemPickerViewController: PHPickerViewController = {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 5
        configuration.filter = .any(of: [.images, .livePhotos])
        let pickerView = PHPickerViewController(configuration: configuration)
        pickerView.modalPresentationStyle = .fullScreen
        return pickerView
    }()
    private let marketRegisterAndEditViewModel = MarketRegisterAndEditViewModel()
    private var itemImageCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBindData()
        setDataSource()
        setDelegate()
        setConstraint()
        setNotificationCenter()
    }
    
    private func setBindData() {
        self.marketRegisterAndEditViewModel.imageChanged = {
            if self.itemImageCount == self.marketRegisterAndEditViewModel.itemImageCount {
                self.imageCollectionView.reloadData()
            }
        }
    }
    
    private func setNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(tappedAddButton), name: NSNotification.Name("TapAddButton"), object: nil)
    }
    
    @objc private func tappedAddButton() {
        self.present(self.itemPickerViewController, animated: true, completion: nil)
    }
    
    func setRegisterAndEditViewController(state: State) {
        self.view.backgroundColor = .white
        switch state {
        case .registration:
            self.navigationItem.title = State.registration.rawValue
        case .edit:
            self.navigationItem.title = State.edit.rawValue
        }
    }
    
    private func setDataSource() {
        self.imageCollectionView.dataSource = self
    }
    
    private func setDelegate() {
        self.imageCollectionView.delegate = self
        self.itemPickerViewController.delegate = self
    }
    
    private func setConstraint() {
        setImageCollectionView()
    }
    
    private func setImageCollectionView() {
        self.view.addSubview(self.imageCollectionView)
        
        NSLayoutConstraint.activate([
            self.imageCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            self.imageCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.imageCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            self.imageCollectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/10)
        ])
    }
}

extension MarketRegisterAndEditViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.marketRegisterAndEditViewModel.itemImageCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.imageCollectionView.dequeueReusableCell(withReuseIdentifier: MarketImageCollectionViewCell.identifier, for: indexPath) as? MarketImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configurateImageCell(image: self.marketRegisterAndEditViewModel.getItemImage(index: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let reuseableView = self.imageCollectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MarketImageCollectionViewHeader.identifier, for: indexPath) as? MarketImageCollectionViewHeader else {
            return UICollectionReusableView()
        }
        reuseableView.configrateHeader()
        return reuseableView
    }
}

extension MarketRegisterAndEditViewController: UICollectionViewDelegate {
    
}

extension MarketRegisterAndEditViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.height * 1/13, height: self.view.frame.height * 1/13)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.height * 1/13, height: self.view.frame.height * 1/50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
}

extension MarketRegisterAndEditViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        self.itemImageCount = 0
        
        for result in results {
            self.itemImageCount += 1
            if result.itemProvider.canLoadObject(ofClass: UIImage.self) {
                result.itemProvider.loadObject(ofClass: UIImage.self, completionHandler: { [weak self] image, error in
                    guard let image = image as? UIImage else { return }
                    DispatchQueue.main.async {
                        self?.marketRegisterAndEditViewModel.appendItemImage(image)
                    }
                })
            } else {
                picker.dismiss(animated: true, completion: nil)
            }
        }
    }
}
