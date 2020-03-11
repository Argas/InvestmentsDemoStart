//
//  DetailsInteractor.swift
//  Investments
//
//  Created by finteh on 09.03.2020.
//  Copyright © 2020 argas. All rights reserved.
//

import Foundation

class StockDetailsInteractor {
    private let symbol: String
    
    weak var controller: StockDetailsController?
    private let userService: IUserService
    private let stockPriceService: IStockPriceService
    private let stockDetailsService: IStockDetailsService
    
    var price: Double?
    
    init(symbol: String, userService: IUserService, stockPriceService: IStockPriceService, stockDetailsService: IStockDetailsService) {
        self.symbol = symbol
        self.stockPriceService = stockPriceService
        self.stockDetailsService = stockDetailsService
        self.userService = userService
    }
    
    func load() {
        let group = DispatchGroup()
        
        var info: SymbolDetails?
        var price: SymbolPrice?
        
        group.enter()
        stockDetailsService.details(for: symbol) { result in
            switch result {
            case .failure(let err):
                print(err)
            case .success(let model):
                info = model
            }
            group.leave()
        }
        
        group.enter()
        stockPriceService.price(for: symbol) { result in
            switch result {
            case .failure(let err):
                print(err)
            case .success(let model):
                price = model
                self.price = price?.current
            }
            group.leave()
        }
        
        group.notify(queue: .main) {
            guard let info = info, let price = price else {
                return
            }
            
            let model = DetailsViewController.Model(
                price: "\(price.current) $",
                ticket: self.symbol,
                name: info.name,
                description: info.description,
                url: info.weburl)
            
            self.controller?.setup(model)
        }
    }
    
    func buy() {
        guard var price = self.price else { return }
        
        // Представим странную логику, что для неграждан есть налог 20%
        if userService.currentUser.citizenship != "RU" {
            price *= 1.2 // foreign citizenship tax
        }
        
        // Представим что мы плохие и жадные и добавляет на все комиссию 100$
        price += 100 // comission
        
        
        self.stockPriceService.pay(sum: price) { [weak self] result in
            switch result {
            case .success:
                self?.controller?.showSuccess()
            case .failure(let error):
                self?.controller?.show(error: error)
            }
        }
        
    }
}
