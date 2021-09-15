//
//  NetworkManager.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/08/26.
//

import Foundation

final class NetworkManager {
    private let loader: OpenMarketNetwork
    private let decoder: MarketDecode
    private let encoder: MarketEncode
    
    init(loader: OpenMarketNetwork, decoder: MarketDecode, encoder: MarketEncode) {
        self.loader = loader
        self.decoder = decoder
        self.encoder = encoder
    }
    
    func excuteFetch<T>(request: URLRequest, decodeType: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T: Decodable {
        self.loader.excuteNetwork(request: request) { [weak self] result in
            switch result {
            case .success(let data):
                do {
                    guard let data = data else { return }
                    guard let jsonDecode = try self?.decoder.decode(T.self, from: data) else { return }
                    completion(.success(jsonDecode))
                } catch {
                    completion(.failure(MarketModelError.decoding(error)))
                }
            case .failure(let error):
                completion(.failure(MarketModelError.network(error)))
            }
        }
    }
    
    func excutePost(request: URLRequest, completion: @escaping (Error) -> Void) {
        self.loader.excuteNetwork(request: request) { result in
            switch result {
            case .success(let data):
                // TODO: - POST 후 받은 것을 가지고 다른 기능 구현가능
                guard let _ = data else { return }
            case .failure(let error):
                completion(MarketModelError.request(error))
            }
        }
    }
    
    func createRequest(_ page: Int) -> URLRequest? {
        guard let fetchURL = NetworkConstant.itemList(page: page).url else { return nil }
        let request = URLRequest(url: fetchURL)
        
        return request
    }
    
    func createRequet<T: Encodable>(data: T, itemID: Int) throws -> URLRequest? {
        let encodeData: Data
        
        do {
            encodeData = try encoder.encode(data)
        } catch {
            throw MarketModelError.encoding(error)
        }
        
        guard let deleteURL = NetworkConstant.delete(id: itemID).url else { return nil }
        var request = URLRequest(url: deleteURL)
        request.httpMethod = "DELETE"
        request.httpBody = encodeData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    func createRequest<T: MultiPartForm>(url: URL?, encodeType: T, method: NetworkConstant.Method) throws -> URLRequest {
        guard let url = url else { throw MarketModelError.url }
            
        switch method {
        case .post:
            return createMultipartFormRequest(url: url, type: encodeType, method: .post)
        case .patch:
            return createMultipartFormRequest(url: url, type: encodeType, method: .patch)
        default :
            throw MarketModelError.createRequest
        }
    }
    
    private func createMultipartFormRequest<T: MultiPartForm>(url: URL, type: T, method: NetworkConstant.Method) -> URLRequest {
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
    
    private func baseBoundary() -> String {
        return "Boundary-\(UUID().uuidString)"
    }
    
    private func createBody(dictionaryData: [String: Any?], _ boundary: String) -> Data {
        var body = Data()
        
        for (key, value) in dictionaryData {
            if value == nil {
                continue
            } else if let value = value as? [Data] {
                body.append(convertMulitPartForm(imageName: key, images: value, boundary: boundary))
            } else if let value = value {
                body.append(convertMulitPartForm(name: key, value: value, boundary: boundary))
            }
        }
    
        body.append("--\(boundary)--\r\n")
        
        return body
    }
    
    private func convertMulitPartForm(name: String, value: Any, boundary: String) -> Data {
        var element = Data()
        
        element.append("--\(boundary)\r\n")
        element.append("Content-Disposition: form-data; name=\"\(name)\"\r\n\r\n")
        element.append("\(value)\r\n")
        
        return element
    }
    
    private func convertMulitPartForm(imageName: String, images: [Data], boundary: String) -> Data {
        var element = Data()
        
        for image in images {
            element.append("--\(boundary)\r\n")
            element.append("Content-Disposition: form-data; name=\"images[]\"; filename=\"\(imageName)\"\r\n")
            element.append("Content-Type: image/png\r\n\r\n")
            element.append(image)
            element.append("\r\n")
        }
        
        return element
    }
}
