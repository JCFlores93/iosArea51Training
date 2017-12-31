//
//  Calculadora.swift
//  C22_0412_M03_C4_
//
//  Created by Alumno on 12/4/17.
//  Copyright © 2017 Area51. All rights reserved.
//

import Foundation

public enum Operation{
    case suma
    case resta
    case dividir
    case multiplica
}

class Calculadora {
    static func hacerOperacion(operacion: Operation, value1: String, value2: String) -> Int?{
        switch operacion {
        case .suma:
            return sumar(value1: value1, value: value2)
            break
        case .resta:
            return resta(value1: value1, value: value2)
            break
        case .multiplica:
            return multiplica(value1: value1, value: value2)
            break
        case .dividir:
            return dividir(value1: value1, value: value2)
            break
        default:
            break
        }
    }
    
    static func sumar(value1: String, value: String) -> Int?{
        
        return 0
    }
    
    static func resta(value1: String, value: String) -> Int?{
        return 0
    }
    
    static func dividir(value1: String, value: String) -> Int?{
        return 0
    }
    
    static func multiplica(value1: String, value: String) -> Int?{
        return 0
    }
    
    //Casteando a entero si se cae retorna
    func validar(d: String, w: String) -> Bool {
        guard let _ = Int(d), let _ = Int(w) else { return false}
        
    }
}
