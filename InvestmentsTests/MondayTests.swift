//
//  MondayTests.swift
//  MondayTests
//
//  Created by finteh on 01.03.2020.
//  Copyright © 2020 argas. All rights reserved.
//

import XCTest
import Nimble
@testable import Investments

class MondayTests: XCTestCase {
    
//    var interactor: StockDetailsInteractor!
//    var priceService: PriceServiceMock!
//    var userService: UserServiceMock!
//    var stockDetailsService: StockDetailsServiceMock!
//    var controller: ControllerMock!
    
    override func setUp() {
//        controller = ControllerMock()
//        priceService = PriceServiceMock()
//        userService = UserServiceMock()
//        stockDetailsService = StockDetailsServiceMock()
        
        // Инерактор - настоящий
//        interactor = StockDetailsInteractor(symbol: "A",
//                                            userService: userService,
//                                            stockPriceService: priceService,
//                                            stockDetailsService: stockDetailsService)
//        interactor.controller = controller
    }
    
    // Проверяем, что всегда добавляется комиссия 100 единиц.
    func testComission() {
        // Given
        // ..

        // When
        // ..

        // Then
        // ..
    }
    
    // Проверяем, что для неграждан РФ срабатывает налог 20%
    func testNonCitizenshipTax() {
        // Given
        // ..

        // When
        // ..

        // Then
        // ..
    }
    
    // Проверяем, успешную оплату
    func testSuccessPayment() {
        // Given
        // ..

        // When
        // ..

        // Then
        // ..
    }
    
    // Проверяем, ошибку в оплате
    func testFailurePayment() {
        // Given
        // ..

        // When
        // ..

        // Then
        // ..
    }
}

//class StockDetailsServiceMock: IStockDetailsService {
//
//}
//
//class PriceServiceMock: IStockPriceService {
//
//}
//
//class UserServiceMock: IUserService {
//
//}
//
//class ControllerMock: StockDetailsController {
//
//}
