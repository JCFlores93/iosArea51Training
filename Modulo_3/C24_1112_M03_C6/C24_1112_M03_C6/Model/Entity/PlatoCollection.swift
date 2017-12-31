//
//  PlatoCollection.swift
//  C24_1112_M03_C6
//
//  Created by Alumno on 12/11/17.
//  Copyright © 2017 Area51. All rights reserved.
//

import Foundation

class PlatoCollection {
    static func platos() -> [Plato] {
        return bulkdata()
    }
    
    
    private static func bulkdata() -> [Plato] {
        let p1 = Plato(name: "Aji de gallina", content: "Plato de comida hecho de pollo, descripcion", picture: nil)
        let p2 = Plato(name: "Seco de pollo", content: "Descripcion del plato", picture: nil)
        let p3 = Plato(name: "Estofado", content: "Descripcion del plato para ordenar", picture: nil)

        return [p1, p2]
    }
    
}
