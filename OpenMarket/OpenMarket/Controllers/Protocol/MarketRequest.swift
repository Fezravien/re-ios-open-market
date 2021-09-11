//
//  MarketRequest.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/09/07.
//

import Foundation

protocol MarketRequest: MulitPartFormConvert {
    func createRequest<T: NetworkExchangeable>(url: URL?, type: T, method: NetworkConstant.Method) throws -> URLRequest?
    func createMultipartFormRequest<T: NetworkExchangeable>(url: URL, type: T, method: NetworkConstant.Method) -> URLRequest
}

extension MarketRequest {
    func createRequest<T: NetworkExchangeable>(url: URL?, type: T, method: NetworkConstant.Method) throws -> URLRequest? {
        guard let url = url else { throw MarketModelError.url }
        
        switch method {
        case .delete:
            let encode: Data
            do {
                encode = try JSONEncoder().encode(type)
            } catch {
                throw MarketModelError.encoding(error)
            }
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
            request.httpBody = encode
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            return request
        case .post:
            return createMultipartFormRequest(url: url, type: type, method: .post)
        case .patch:
            return createMultipartFormRequest(url: url, type: type, method: .patch)
        case .get:
            throw MarketModelError.get
        }
    }
    
    func createMultipartFormRequest<T: NetworkExchangeable>(url: URL, type: T, method: NetworkConstant.Method) -> URLRequest {
        let boundary = baseBoundary()
        let mirror = Mirror(reflecting: type)
        var bodyToDictionary: [String: Any] = [:]
        
        mirror.children.forEach {
            guard let label = $0.label else { return }
            bodyToDictionary["\(label)"] = $0.value
        }
        
        let encodeBody = createBody(dictionaryData: bodyToDictionary, boundary)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpBody = encodeBody
        
        return request
    }
}
