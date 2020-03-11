//
//  Assembler.swift
//  Investments
//
//  Created by finteh on 09.03.2020.
//  Copyright © 2020 argas. All rights reserved.
//

import Foundation

class RootAssembly {
    lazy var core = CoreAssembly()
    lazy var services = ServicesAssembly(core: core)
    lazy var presentation = PresentationAssembly(servicesAssembly: services)
}

// MARK: - Service

class ServicesAssembly {
    private let core: CoreAssembly
    
    init(core: CoreAssembly) {
        self.core = core
    }
    
    var userService: IUserService {
        return UserService()
    }
    
    var stocksListService: IStockListService {
        return StockListService(network: core.network)
    }
    
    var stockDetailsService: IStockDetailsService {
        return StockDetailsService(network: core.network)
    }
    
    var stockPriceService: IStockPriceService {
        return StockPriceService(network: core.network)
    }
}

// MARK: - Presentation

class PresentationAssembly {
    private let services: ServicesAssembly
    
    init(servicesAssembly: ServicesAssembly) {
        self.services = servicesAssembly
    }
    
    lazy var stocksList = StocksListAssembly(servicesAssembly: services, detailsAssembly: stockDetails)
    lazy var stockDetails = StockDetailsAssembly(servicesAssembly: services)
}

class CoreAssembly {
    let network = Network()
}

// MARK: List

struct StocksListAssembly {
   
    let servicesAssembly: ServicesAssembly
    let detailsAssembly: StockDetailsAssembly
    
    var vc: StocksListViewController {
        let intercator = stockListInteractor
        let vc = StocksListViewController(interactor: intercator, detailsAssembly: detailsAssembly)
        intercator.controller = vc
        intercator.router = vc
        return vc
    }
    
    var stockListInteractor: StocksListInteractor {
        return StocksListInteractor(stockListService: servicesAssembly.stocksListService)
    }
}

// MARK: Details

struct StockDetailsAssembly {
   
    let servicesAssembly: ServicesAssembly
    
    func viewController(for sybmol: String) -> DetailsViewController {
        let interactor = stockDetailsInteractor(for: sybmol)
        let vc = DetailsViewController(interactor: interactor)
        interactor.controller = vc
        return vc
    }
    
    func stockDetailsInteractor(for symbol: String) -> StockDetailsInteractor {
        return StockDetailsInteractor(symbol: symbol,
                                      userService: servicesAssembly.userService,
                                      stockPriceService: servicesAssembly.stockPriceService,
                                      stockDetailsService: servicesAssembly.stockDetailsService)
    }
}
