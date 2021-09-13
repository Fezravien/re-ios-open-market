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
    
    struct itemInfomation {
        var title: String?
        var currency: String?
        var price: String?
        var discountPrice: String?
        var stock: String?
        var itemDescription: String?
    }
    
    enum State: String {
        case registration = "상품등록"
        case edit = "상품수정"
    }
    
    private enum CurrencyState: String, CaseIterable {
        case korea = "KRW"
        case usa = "USD"
        case japan = "JPY"
    }
    
    private enum Identifier {
        static let itemTitle = "Title"
        static let itemPrice = "Price"
        static let itemDiscountPrice = "DiscountPrice"
        static let itemStock = "Stock"
    }
    
    private enum Style {
        enum ImageCollectionView {
            static let margin: UIEdgeInsets = .init(top: 20, left: 0, bottom: 0, right: 0)
            static let height: CGFloat = 1/10
        }
        
        enum ItemTitle {
            static let margin: UIEdgeInsets = .init(top: 30, left: 15, bottom: 0, right: -15)
        }
        
        enum ItemCurrency {
            static let margin: UIEdgeInsets = .init(top: 30, left: 15, bottom: 0, right: 0)
            static let width: CGFloat = 3/20
        }
        
        enum ItemPrice {
            static let margin: UIEdgeInsets = .init(top: 0, left: 15, bottom: 0, right: -15)
        }
        
        enum ItemDiscountPrice {
            static let margin: UIEdgeInsets = .init(top: 30, left: 15, bottom: 0, right: -15)
        }
        
        enum ItemStock {
            static let margin: UIEdgeInsets = .init(top: 30, left: 15, bottom: 0, right: -15)
        }
        
        enum ItemDescription {
            static let margin: UIEdgeInsets = .init(top: 30, left: 15, bottom: 0, right: -15)
        }
        
        enum CollectionHeader {
            static let margin: UIEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 0)
        }
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
        textField.textColor = .black
        textField.autocorrectionType = .no
        textField.placeholder = "글 제목을 입력해주세요"
        textField.accessibilityIdentifier = Identifier.itemTitle
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let itemCurrency: UITextField = {
        let textField = UITextField()
        textField.font = .preferredFont(forTextStyle: .subheadline)
        textField.textColor = .black
        textField.autocorrectionType = .no
        textField.textAlignment = .center
        textField.placeholder = "화폐단위"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let itemPrice: UITextField = {
        let textField = UITextField()
        textField.font = .preferredFont(forTextStyle: .headline)
        textField.textColor = .black
        textField.autocorrectionType = .no
        textField.placeholder = "상품의 가격을 입력해주세요"
        textField.accessibilityIdentifier = Identifier.itemPrice
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let itemDiscountPrice: UITextField = {
        let textField = UITextField()
        textField.font = .preferredFont(forTextStyle: .headline)
        textField.textColor = .black
        textField.autocorrectionType = .no
        textField.placeholder = "상품의 할인가를 입력해주세요 (옵션)"
        textField.accessibilityIdentifier = Identifier.itemDiscountPrice
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let itemStock: UITextField = {
        let textField = UITextField()
        textField.font = .preferredFont(forTextStyle: .headline)
        textField.textColor = .black
        textField.autocorrectionType = .no
        textField.placeholder = "상품의 수량을 입력해주세요"
        textField.accessibilityIdentifier = Identifier.itemStock
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
    private let currencyPickerToolber: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.backgroundColor = .systemGray
        toolbar.sizeToFit()
        return toolbar
    }()
    private let currencyPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()
    private let marketRegisterAndEditViewModel = MarketRegisterAndEditViewModel()
    private var state: State?
    private var itemImageCount = 0
    private var currencys = CurrencyState.allCases.map { $0.rawValue }
    private var itemInfomation = itemInfomation(title: nil, currency: nil, price: nil, discountPrice: nil, stock: nil, itemDescription: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBindData()
        setDataSource()
        setDelegate()
        setConstraints()
        setCurrencyTextField()
        setNotificationCenter()
    }
    
    private func setBindData() {
        self.marketRegisterAndEditViewModel.imageChanged = {
            if self.itemImageCount == self.marketRegisterAndEditViewModel.itemImageCount {
                self.imageCollectionView.reloadData()
            }
        }
    }
    func setRegisterAndEditViewController(state: State) {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(tappedFinishDoneButton))
        self.view.backgroundColor = .white
        self.state = state
        switch state {
        case .registration:
            self.navigationItem.title = State.registration.rawValue
        case .edit:
            self.navigationItem.title = State.edit.rawValue
        }
    }
    
    private func setNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(tappedAddButton), name: NSNotification.Name(MarketRegisterAndEditViewController.notificationName), object: nil)
    }
    
    @objc private func tappedAddButton() {
        self.present(self.itemPickerViewController, animated: true, completion: nil)
    }
    
    @objc private func tappedFinishDoneButton() {
        switch self.state {
        case .registration:
            if validItemInfomation() {
                self.alertInputPassword { [weak self] password in
                    guard let request = self?.createRequest(password) else { return }
                    self?.marketRegisterAndEditViewModel.post(request: request, decodeType: Item.self, completion: { result in
                        switch result {
                        case .success(_):
                            DispatchQueue.main.async {
                                self?.navigationController?.popViewController(animated: true)
                            }
                        case .failure(_) :
                            return
                        }
                    })
                    
                }
            }
        case .edit:
            print()
        case .none:
            return
        }
        
    }
    
    private func createRequest(_ password: String) -> URLRequest? {
        let request: URLRequest?
        guard let title = self.itemInfomation.title,
              let currency = self.itemInfomation.currency,
              let price = self.itemInfomation.price,
              let stock = self.itemInfomation.stock,
              let description = self.itemInfomation.itemDescription else {
            
            return nil
        }
        
        let registerationData = ItemRegistration(title: title,
                                                 descriptions: description,
                                                 price: UInt(price)!,
                                                 currency: currency,
                                                 stock: UInt32(stock)!,
                                                 discountedPrice: self.itemInfomation.discountPrice == nil ? nil : UInt(self.itemInfomation.discountPrice ?? "")!,
                                                 images: self.marketRegisterAndEditViewModel.getItemImages(),
                                                 password: password)
        
        do {
            request = try self.marketRegisterAndEditViewModel.createRequest(url: NetworkConstant.registrate.url, type: registerationData, method: .post)
            return request
        } catch {
            return nil
        }
    }
    
    private func validItemInfomation() -> Bool {
        guard let _ = self.itemInfomation.title else {
            self.alert(title: MarketInputError.title.rawValue)
            return false
        }
        
        guard let _ = self.itemInfomation.currency else {
            self.alert(title: MarketInputError.currency.rawValue)
            return false
        }
        
        guard let _ = self.itemInfomation.price else {
            self.alert(title: MarketInputError.price.rawValue)
            return false
        }
        
        guard let _ = self.itemInfomation.stock else {
            self.alert(title: MarketInputError.stock.rawValue)
            return false
        }
        
        guard let _ = self.itemInfomation.itemDescription else {
            self.alert(title: MarketInputError.description.rawValue)
            return false
        }
        
        return true
    }
    
    private func setCurrencyTextField() {
        let doneButton = UIBarButtonItem(title: "확인", style: .done, target: self, action: #selector(tappedDoneButton))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let cancelButton = UIBarButtonItem(title: "취소", style: .done, target: self, action: #selector(tappedCancelButton))
        
        self.currencyPickerToolber.setItems([cancelButton, space, doneButton], animated: true)
        self.currencyPickerToolber.isUserInteractionEnabled = true
        self.itemCurrency.inputView = self.currencyPickerView
        self.itemCurrency.inputAccessoryView = self.currencyPickerToolber
    }
    
    @objc private func tappedDoneButton() {
        self.itemCurrency.text = self.itemInfomation.currency ?? ""
        self.itemCurrency.resignFirstResponder()
    }
    
    @objc private func tappedCancelButton() {
        self.itemCurrency.resignFirstResponder()
    }
    
    private func setDataSource() {
        self.imageCollectionView.dataSource = self
    }
    
    private func setDelegate() {
        self.imageCollectionView.delegate = self
        self.itemPickerViewController.delegate = self
        self.currencyPickerView.delegate = self
        self.itemTitle.delegate = self
        self.itemPrice.delegate = self
        self.itemDiscountPrice.delegate = self
        self.itemStock.delegate = self
        self.itemDescription.delegate = self
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
            self.imageCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: Style.ImageCollectionView.margin.top),
            self.imageCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.imageCollectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: Style.ImageCollectionView.height)
        ])
    }
    
    private func setItemTitleConstraint() {
        self.view.addSubview(self.itemTitle)
        
        NSLayoutConstraint.activate([
            self.itemTitle.leadingAnchor.constraint(equalTo: self.imageCollectionView.leadingAnchor, constant: Style.ItemTitle.margin.left),
            self.itemTitle.topAnchor.constraint(equalTo: self.imageCollectionView.bottomAnchor, constant: Style.ItemTitle.margin.top),
            self.itemTitle.trailingAnchor.constraint(equalTo: self.imageCollectionView.trailingAnchor, constant: Style.ItemTitle.margin.right),
        ])
    }
    
    private func setItemCurrencyConstraint() {
        self.view.addSubview(self.itemCurrency)
        
        NSLayoutConstraint.activate([
            self.itemCurrency.leadingAnchor.constraint(equalTo: self.imageCollectionView.leadingAnchor, constant: Style.ItemCurrency.margin.left),
            self.itemCurrency.topAnchor.constraint(equalTo: self.itemTitle.bottomAnchor, constant: Style.ItemCurrency.margin.top),
            self.itemCurrency.widthAnchor.constraint(equalTo: self.itemTitle.widthAnchor, multiplier: Style.ItemCurrency.width)
        ])
    }
    
    private func setItemPriceConstraint() {
        self.view.addSubview(self.itemPrice)
        
        NSLayoutConstraint.activate([
            self.itemPrice.leadingAnchor.constraint(equalTo: self.itemCurrency.trailingAnchor, constant: Style.ItemPrice.margin.left),
            self.itemPrice.topAnchor.constraint(equalTo: self.itemCurrency.topAnchor),
            self.itemPrice.trailingAnchor.constraint(equalTo: self.imageCollectionView.trailingAnchor, constant: Style.ItemPrice.margin.right)
        ])
    }
    
    private func setItemDiscountPriceConstraint() {
        self.view.addSubview(self.itemDiscountPrice)
        
        NSLayoutConstraint.activate([
            self.itemDiscountPrice.leadingAnchor.constraint(equalTo: self.imageCollectionView.leadingAnchor, constant: Style.ItemDiscountPrice.margin.left),
            self.itemDiscountPrice.topAnchor.constraint(equalTo: self.itemCurrency.bottomAnchor, constant: Style.ItemDiscountPrice.margin.top),
            self.itemDiscountPrice.trailingAnchor.constraint(equalTo: self.imageCollectionView.trailingAnchor, constant: Style.ItemDiscountPrice.margin.right),
        ])
    }
    
    private func setItemStockConstraint() {
        self.view.addSubview(self.itemStock)
        
        NSLayoutConstraint.activate([
            self.itemStock.leadingAnchor.constraint(equalTo: self.imageCollectionView.leadingAnchor, constant: Style.ItemStock.margin.left),
            self.itemStock.topAnchor.constraint(equalTo: self.itemDiscountPrice.bottomAnchor, constant: Style.ItemStock.margin.top),
            self.itemStock.trailingAnchor.constraint(equalTo: self.imageCollectionView.trailingAnchor, constant: Style.ItemStock.margin.right),
        ])
    }
    
    private func setItemDescriptionConstraint() {
        self.view.addSubview(self.itemDescription)
        
        NSLayoutConstraint.activate([
            self.itemDescription.leadingAnchor.constraint(equalTo: self.imageCollectionView.leadingAnchor, constant: Style.ItemDescription.margin.left),
            self.itemDescription.topAnchor.constraint(equalTo: self.itemStock.bottomAnchor, constant: Style.ItemDescription.margin.top),
            self.itemDescription.trailingAnchor.constraint(equalTo: self.imageCollectionView.trailingAnchor, constant: Style.ItemDescription.margin.right),
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
        return Style.CollectionHeader.margin
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

extension MarketRegisterAndEditViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.currencys.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.currencys[row]
    }
}

extension MarketRegisterAndEditViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.itemInfomation.currency = self.currencys[row]
    }
}

extension MarketRegisterAndEditViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.accessibilityIdentifier {
        case Identifier.itemTitle:
            self.itemInfomation.title = textField.text
        case Identifier.itemPrice:
            guard let _ = Int(textField.text ?? "") else {
                self.alert(title: MarketInputError.priceType.rawValue)
                self.itemPrice.text = nil
                return
            }
            self.itemInfomation.price = textField.text
        case Identifier.itemDiscountPrice:
            guard let _ = Int(textField.text ?? "") else {
                self.alert(title: MarketInputError.discountPriceType.rawValue)
                self.itemDiscountPrice.text = nil
                return
            }
            self.itemInfomation.discountPrice = textField.text
        case Identifier.itemStock:
            guard let _ = Int(textField.text ?? "") else {
                self.alert(title: MarketInputError.stockType.rawValue)
                self.itemStock.text = nil
                return
            }
            self.itemInfomation.stock = textField.text
        default:
            return
        }
    }
}

extension MarketRegisterAndEditViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        self.itemInfomation.itemDescription = textView.text
    }
}
