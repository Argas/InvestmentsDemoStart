//
//  Network.swift
//  Investments
//
//  Created by finteh on 09.03.2020.
//  Copyright © 2020 argas. All rights reserved.
//

import Foundation


// MARK: -

protocol INetwrok {
    func load<T>(request: T, completion: @escaping (Result<T.Model, Error>) -> Void)
        where T: IRequest, T: IRequestWithModel
}

class Network: INetwrok {
    func load<T>(request: T, completion: @escaping (Result<T.Model, Error>) -> Void)
        where T: IRequest, T: IRequestWithModel {
            print("✳️\(request.urlRequst.url?.absoluteString)")
            let task = URLSession.shared.dataTask(with: request.urlRequst) { (data, _, e) in
                if let error = e {
                    completion(.failure(error))
                    return
                }
                
                guard let d = data else {
                    return
                }
                
                do {
                    let model = try JSONDecoder().decode(T.Model.self, from: d)
                    
                    completion(.success(model))
                    
                } catch let e {
                    completion(.failure(e))
                }
            }
            
            task.resume()
    }
}

// MARK: - IRequest

protocol IRequest {
    var urlRequst: URLRequest { get }
}

protocol IRequestWithModel {
    associatedtype Model: Decodable
}

protocol GetRequest {
    var baseUrl: String { get }
    var path: String { get }
    var params: [String: String] { get }
    var baseParams: [String: String] { get }
}

extension IRequest where Self: GetRequest {
    var urlRequst: URLRequest {
        var urlStr = "\(baseUrl)\(path)?"
        var paramsStr = ""
        params.forEach { (k,v) in
            paramsStr += "&\(k)=\(v)"
        }
        baseParams.forEach { (k,v) in
            paramsStr += "&\(k)=\(v)"
        }
        urlStr += paramsStr.dropFirst()
        let url = URL(string: urlStr)!
        return URLRequest(url: url)
    }
}
