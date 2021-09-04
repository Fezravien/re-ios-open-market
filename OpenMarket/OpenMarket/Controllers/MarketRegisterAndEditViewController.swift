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
    static let notificationName = "TapAddButton"
    
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
    private let itemTitle: UITextField = {
        let textField = UITextField()
        textField.font = .preferredFont(forTextStyle: .headline)
        textField.autocorrectionType = .no
        textField.placeholder = "글 제목을 입력해주세요"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let itemCurrency: UITextField = {
        let textField = UITextField()
        textField.font = .preferredFont(forTextStyle: .subheadline)
        textField.autocorrectionType = .no
        textField.placeholder = "화폐단위"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let itemPrice: UITextField = {
        let textField = UITextField()
        textField.font = .preferredFont(forTextStyle: .headline)
        textField.autocorrectionType = .no
        textField.placeholder = "상품의 가격을 입력해주세요"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let itemDiscountPrice: UITextField = {
        let textField = UITextField()
        textField.font = .preferredFont(forTextStyle: .headline)
        textField.autocorrectionType = .no
        textField.placeholder = "상품의 할인가를 입력해주세요 (옵션)"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let itemStock: UITextField = {
        let textField = UITextField()
        textField.font = .preferredFont(forTextStyle: .headline)
        textField.autocorrectionType = .no
        textField.placeholder = "상품의 수량을 입력해주세요"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let itemDescription: UITextView = {
        let textView = UITextView()
        textView.font = .preferredFont(forTextStyle: .subheadline)
        textView.autocorrectionType = .no
        textView.layer.borderColor = CGColor(gray: 0.8, alpha: 0.8)
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 20
        textView.textAlignment = .justified
        textView.contentInset = .init(top: 5, left: 10, bottom: -5, right: -10)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    private let marketRegisterAndEditViewModel = MarketRegisterAndEditViewModel()
    private var itemImageCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBindData()
        setDataSource()
        setDelegate()
        setConstraints()
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
        NotificationCenter.default.addObserver(self, selector: #selector(tappedAddButton), name: NSNotification.Name(MarketRegisterAndEditViewController.notificationName), object: nil)
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
    
    private func setConstraints() {
        setImageCollectionView()
        setItemTitleConstraint()
        setItemCurrencyConstraint()
        setItemPriceConstraint()
        setItemDiscountPriceConstraint()
        setItemStockConstraint()
        setItemDescriptionConstraint()
    }
    
    private func setImageCollectionView() {
        self.view.addSubview(self.imageCollectionView)
        
        NSLayoutConstraint.activate([
            self.imageCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.imageCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.imageCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.imageCollectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/10)
        ])
    }
    
    private func setItemTitleConstraint() {
        self.view.addSubview(self.itemTitle)
        
        NSLayoutConstraint.activate([
            self.itemTitle.leadingAnchor.constraint(equalTo: self.imageCollectionView.leadingAnchor, constant: 15),
            self.itemTitle.topAnchor.constraint(equalTo: self.imageCollectionView.bottomAnchor, constant: 30),
            self.itemTitle.trailingAnchor.constraint(equalTo: self.imageCollectionView.trailingAnchor, constant: -15),
        ])
    }
    
    private func setItemCurrencyConstraint() {
        self.view.addSubview(self.itemCurrency)
        
        NSLayoutConstraint.activate([
            self.itemCurrency.leadingAnchor.constraint(equalTo: self.imageCollectionView.leadingAnchor, constant: 15),
            self.itemCurrency.topAnchor.constraint(equalTo: self.itemTitle.bottomAnchor, constant: 30),
            self.itemCurrency.widthAnchor.constraint(equalTo: self.itemTitle.widthAnchor, multiplier: 3/20)
        ])
    }
    
    private func setItemPriceConstraint() {
        self.view.addSubview(self.itemPrice)
        
        NSLayoutConstraint.activate([
            self.itemPrice.leadingAnchor.constraint(equalTo: self.itemCurrency.trailingAnchor, constant: 15),
            self.itemPrice.topAnchor.constraint(equalTo: self.itemCurrency.topAnchor),
            self.itemPrice.trailingAnchor.constraint(equalTo: self.imageCollectionView.trailingAnchor, constant: -15)
        ])
    }
    
    private func setItemDiscountPriceConstraint() {
        self.view.addSubview(self.itemDiscountPrice)
        
        NSLayoutConstraint.activate([
            self.itemDiscountPrice.leadingAnchor.constraint(equalTo: self.imageCollectionView.leadingAnchor, constant: 15),
            self.itemDiscountPrice.topAnchor.constraint(equalTo: self.itemCurrency.bottomAnchor, constant: 30),
            self.itemDiscountPrice.trailingAnchor.constraint(equalTo: self.imageCollectionView.trailingAnchor, constant: -15),
        ])
    }
    
    private func setItemStockConstraint() {
        self.view.addSubview(self.itemStock)
        
        NSLayoutConstraint.activate([
            self.itemStock.leadingAnchor.constraint(equalTo: self.imageCollectionView.leadingAnchor, constant: 15),
            self.itemStock.topAnchor.constraint(equalTo: self.itemDiscountPrice.bottomAnchor, constant: 30),
            self.itemStock.trailingAnchor.constraint(equalTo: self.imageCollectionView.trailingAnchor, constant: -15),
        ])
    }
    
    private func setItemDescriptionConstraint() {
        self.view.addSubview(self.itemDescription)
        
        NSLayoutConstraint.activate([
            self.itemDescription.leadingAnchor.constraint(equalTo: self.imageCollectionView.leadingAnchor, constant: 15),
            self.itemDescription.topAnchor.constraint(equalTo: self.itemStock.bottomAnchor, constant: 30),
            self.itemDescription.trailingAnchor.constraint(equalTo: self.imageCollectionView.trailingAnchor, constant: -15),
            self.itemDescription.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
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
    // TODO: - 사진을 누르면 사진 크게 보여주기
}

extension MarketRegisterAndEditViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.height * 1/13, height: self.view.frame.height * 1/13)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.height * 1/13, height: 0)
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
