//
//  StocksListService.swift
//  Investments
//
//  Created by a.y.zverev on 10/03/2020.
//  Copyright © 2020 argas. All rights reserved.
//

import Foundation

protocol IStockListService {
    func loadStocks(for exchange: String, completion: @escaping (Result<[Symbol], Error>) ->  Void)
}

class StockListService: IStockListService {
    private let network: INetwrok
    
    init(network: INetwrok) {
        self.network = network
    }
    
    func loadStocks(for exchange: String, completion: @escaping (Result<[Symbol], Error>) ->  Void) {
        network.load(request: FinnHub.symbols(for: "US"), completion: completion)
    }
}
