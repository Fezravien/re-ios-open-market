//
//  MarketInputError.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/09/06.
//

import Foundation

enum MarketInputError: String {
    case title = "제목을 입력해주세요."
    case currency = "화폐 단위를 입력해주세요."
    case price = "상품의 가격을 입력해주세요."
    case priceType = "상품 가격은 숫자만 가능합니다."
    case discountPriceType = "상품 할인가격은 숫자만 가능합니다."
    case stock = "상품의 개수를 입력해주세요."
    case stockType = "상품 수량은 숫자만 가능합니다."
    case description = "상품 상세설명을 입력해주세요"
}
