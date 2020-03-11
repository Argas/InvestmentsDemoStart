//
//  InvestmentsSnapshotTests.swift
//  InvestmentsUITests
//
//  Created by a.y.zverev on 11/03/2020.
//  Copyright © 2020 argas. All rights reserved.
//

import Foundation
import XCTest
import FBSnapshotTestCase

class MT: FBSnapshotTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
//        recordMode = true
        
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testListSnapshot() {
        
        // Ждем контент
        // ..
        
        // Скриним
        // ..

        // Проверяем
        // ..
    }
    
    func testDetailsSnapshot() {
        
        // Ждем контент
        // ..
        
        // Тапаем в ячейку
        // ..
        
        // Ждем контент Деталей
        // ..
        
        // Скриним
        // ..

        // Проверяем
        // ..
    }
}
