//
//  MarketModelError.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/08/27.
//

import Foundation

enum MarketModelError: Error {
    case request, response(Int)
    case encoding, decoding, casting, network
    case url, data, createRequest
    case get, post, patch, delete
}

extension MarketModelError: LocalizedError {
    var description: String {
        switch self {
        case .request:
            return "⛔️ 요청 오류"
        case .response(let statusCode):
            return "⛔️ 응답 상태코드 : \(statusCode)"
        case .casting:
            return "⛔️ 캐스팅 오류"
        case .network:
            return "⛔️ 네트워크 오류"
        case .data:
            return "⛔️ 데이터 오류 : nil"
        case .encoding:
            return "⛔️ 인코딩 오류"
        case .decoding:
            return "⛔️ 디코딩 오류"
        case .get:
            return "⛔️ \"GET\" 메소드 createRequest 불필요"
        case .post:
            return "⛔️ \"POST\" 메소드 오류"
        case .patch:
            return "⛔️ \"PATCH\" 메소드 오류"
        case .delete:
            return "⛔️ \"DELECT\" 메소드 오류"
        case .url:
            return "⛔️ URL 오류"
        case .createRequest:
            return "⛔️ Request 생성 오류"
        }
    }
}
