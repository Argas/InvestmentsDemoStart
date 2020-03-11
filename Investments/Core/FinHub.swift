//
//  FinHub.swift
//  Investments
//
//  Created by finteh on 09.03.2020.
//  Copyright © 2020 argas. All rights reserved.
//

import Foundation

struct FinnHub {
    static let API_TOKEN = "bolfe7vrh5rd0m2j3ms0"
    static func symbols(for exchange: String) -> SybmolsRequest {
        return SybmolsRequest(exchange: exchange)
    }
    
    static func price(for symbol: String) -> SybmolPriceRequest {
        return SybmolPriceRequest(symbol: symbol)
    }
    
    static func details(for symbol: String) -> SybmolDetailsRequest {
        return SybmolDetailsRequest(symbol: symbol)
    }
}

class FinnHubRequest: GetRequest, IRequest {
    var baseUrl = "https://finnhub.io/api/v1"
    var path: String { "" }
    var baseParams: [String: String] { [
        "token" : FinnHub.API_TOKEN,
        ]}
    var params: [String : String] { [:] }
}

// MARK: Symbols List

class SybmolsRequest: FinnHubRequest, IRequestWithModel {
    typealias Model = [Symbol]
    private let exchange: String
    init(exchange: String) {
        self.exchange = exchange
    }
    
    override var path: String { "/stock/symbol" }
    override var params: [String : String] {
        return [ "exchange" : "\(exchange)" ]
    }
}

struct Symbol: Codable {
    let symbol: String
    let displaySymbol: String
    let description: String?
}

// MARK: Price

class SybmolPriceRequest: FinnHubRequest, IRequestWithModel {
    typealias Model = SymbolPrice
    private let symbol: String
    init(symbol: String) {
        self.symbol = symbol
    }
    
    override var path: String { "/quote" }
    override var params: [String : String] {
        return ["symbol" : "\(symbol)"]
    }
}

struct SymbolPrice: Codable {
    let current: Double
    
    enum CodingKeys: String, CodingKey {
        case current = "c"
    }
}

// MARK: Details

class SybmolDetailsRequest: FinnHubRequest, IRequestWithModel {
    typealias Model = SymbolDetails
    private let symbol: String
    init(symbol: String) {
        self.symbol = symbol
    }
    
    override var path: String { "/stock/profile" }
    override var params: [String : String] {
        return [ "symbol" : "\(symbol)" ]
    }
}

struct SymbolDetails: Codable {
    let description: String
    let name: String
    let marketCapitalization: Double
    let weburl: String?
}
