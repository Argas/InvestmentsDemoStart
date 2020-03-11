//
//  Interactor.swift
//  Investments
//
//  Created by finteh on 09.03.2020.
//  Copyright © 2020 argas. All rights reserved.
//

import Foundation

class StocksListInteractor {
    weak var controller: StocksListController?
    weak var router: StocksListRouter?
    
    private let stockListService: IStockListService
    init(stockListService: IStockListService) {
        self.stockListService = stockListService
    }
    
    func loadSymbols() -> Void {
        controller?.showSpinner()
        stockListService.loadStocks(for: "US") { result in
            self.controller?.hideSpinner()
            switch result {
            case .success(let model):
                let model = StocksListViewController.Model(title: "Symbols", cells: self.makeList(model) )
                
                self.controller?.setup(model:model)
            case .failure(let err):
                print(err)
            }
            
        }
    }
    
    func makeList(_ symols: [Symbol]) -> [InfoView.Model] {
        return symols.prefix(15).map { symbol in
            return InfoView.Model(title: symbol.displaySymbol, subtitle: symbol.description ?? "") {
                print("open \(symbol.displaySymbol)")
                self.router?.showDetails(for: symbol.symbol)
            }
        }
    }
}
