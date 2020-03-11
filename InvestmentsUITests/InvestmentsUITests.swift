//
//  InvestmentsUITests.swift
//  InvestmentsUITests
//
//  Created by finteh on 09.03.2020.
//  Copyright © 2020 argas. All rights reserved.
//

import XCTest

class InvestmentsUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTable() {
        // 1. Проверяем, что в начале есть спинер
        //...
        
        // 2. Дожидаемся, пока загрузятся данные (жду ячейку с текстом `A`)
        //...
    
        // 3. Проверяем, что спинер пропал
        //...
        
        // 4. Проверяем, что ячеек 15
        //...
        
        // 5. Тапаем по ячейке
        //...
        
        // 6. Дождидаемся пока загрузится Заголовок
        //...
        
        // 7. Проверяем поля шапки
        // 7.1 Имя компании: "Applied Optoelectronics Inc"
        //...
        
        // 7.2 ссылка: "http://ao-inc.com/"
        //...
            
        // 7.3 info: AOOI_info
        //...
                
        // 8. Тапаем кнопку купли
        //...
        
        // 9. Ждем алерт об ошибке
        //...
        
        // 9.1 Проверяем, что заголовок алерта "Ошибка"
        //...
        
        // 9.1 Проверяем, что текст алерта "Что-то пошло не так"
        //...
        
        // 10. тапаем ОК
        //...
        
        // 11. проверяем, что алерт пропал
        //...
    }
}


let AOOI_info = """
Applied Optoelectronics, Inc. is a vertically integrated provider of fiber-optic networking products, primarily for networking end markets, such as Internet data center, cable television (CATV), fiber-to-the-home (FTTH) and telecommunications (telecom). The Company designs and manufactures a range of optical communications products at varying levels of integration, from components, subassemblies and modules to turnkey equipment. To Internet-based data center operators, it supplies optical transceivers that plug into switches and servers within the data center and allow these network devices to send and receive data over fiber optic cables. The Company supplies a range of products, including lasers, transmitters and transceivers, and turnkey equipment, to the CATV market. The Company designs, manufactures and integrates its own analog and digital lasers using a combination of Metal Organic Chemical Vapor Deposition (MOCVD) and its Molecular Beam Epitaxy (MBE) fabrication process.
"""
