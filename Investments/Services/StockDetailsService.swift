//
//  StockDetailsService.swift
//  Investments
//
//  Created by a.y.zverev on 10/03/2020.
//  Copyright © 2020 argas. All rights reserved.
//

import Foundation

protocol IStockDetailsService {
    func details(for symbol: String, completion: @escaping (Result<SymbolDetails, Error>) -> Void)
}
class StockDetailsService: IStockDetailsService {
    
    private let network: INetwrok
    
    init(network: INetwrok) {
        self.network = network
    }
    
    func details(for symbol: String, completion: @escaping (Result<SymbolDetails, Error>) -> Void) {
        network.load(request: FinnHub.details(for: symbol), completion: completion)
    }
}
