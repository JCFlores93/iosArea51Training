//
//  CalculadoraViewControllerTests.swift
//  C22_0412_M03_C4_Tests
//
//  Created by Alumno on 12/4/17.
//  Copyright © 2017 Area51. All rights reserved.
//

import XCTest
@testable import C22_0412_M03_C4_ //Clase5

class CalculadoraViewControllerTests: XCTestCase {
    func testSumar(){
        //let calculadora = Calculadora()
        //Calculadora.hacer(operacion: .suma, value1)
        let number = Calculadora.hacer(operacion: .suma,value1: "hsh", value2: "d")
        //XCTAssert(number == nil, "Fallo")
        XCTAseerNil(number, "fallo")
    }
    
    
}
