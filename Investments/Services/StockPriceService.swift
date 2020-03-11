//
//  StockPriceService.swift
//  Investments
//
//  Created by a.y.zverev on 10/03/2020.
//  Copyright © 2020 argas. All rights reserved.
//

import Foundation

protocol IStockPriceService {
    func price(for symbol: String, completion: @escaping (Result<SymbolPrice, Error>) -> Void)
    func pay(sum: Double, completion: @escaping (Result<Bool, Error>) -> Void)
}

class StockPriceService: IStockPriceService {
    private let network: INetwrok
    
    init(network: INetwrok) {
        self.network = network
    }
    
    func price(for symbol: String, completion: @escaping (Result<SymbolPrice, Error>) -> Void) {
        network.load(request: FinnHub.price(for: symbol), completion: completion )
    }
    
    func pay(sum: Double, completion: @escaping (Result<Bool, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(.failure(PayError.undefined))
        }
    }
}

enum PayError: Error {
    case undefined
}
