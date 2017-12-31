//
//  CalculadoraTests.swift
//  Clase 5Tests
//
//  Created by Admin on 12/4/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import XCTest
@testable import Clase_5

class CalculadoraTests: XCTestCase {
    
    func testSumar() {
        
        //let calculadora = Calculadora()
        
        let number = Calculadora.hacer(operacion: .suma, value1: "hsh", value2: "d")
        
        XCTAssertNil(number, "falló")
        
        //XCTAssert(number == nil, "falló")
        
    }
    
}
