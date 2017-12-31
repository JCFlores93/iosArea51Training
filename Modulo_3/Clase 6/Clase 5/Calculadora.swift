//
//  Calculadora.swift
//  Clase 5
//
//  Created by Admin on 12/4/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

public enum Operation {
    case suma
    case resta
    case divide
}

class Calculadora {
    
    static func hacer(operacion: Operation, value1: String, value2: String) -> Int? {
        
        switch operacion {
        case .suma:
            return sumar(value1: value1, value2: value2)
        case .resta:
            return resta(value1: value1, value2: value2)
        case .divide:
            break
        default:
            break
        }
        
        return 0
        
    }
    
    private static func sumar(value1: String, value2: String) -> Int? {
        
        if validar(d: value1, w: value2) {
            //haceer operacion
        }
        return nil
    }
    private static func divide(value1: String, value2: String) -> Int? {
        return 0
    }
    private static func multiplica(value1: String, value2: String) -> Int? {
        return 0
    }
    private static func resta(value1: String, value2: String) -> Int? {
        return 0
    }
    
    static func validar(d: String, w: String)-> Bool{
        
        guard let _ = Int(d), let _ = Int(w) else {return false}
        return true
        
    }
    
}
