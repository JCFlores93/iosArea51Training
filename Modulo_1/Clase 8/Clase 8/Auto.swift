//
//  Auto.swift
//  Clase 8
//
//  Created by Alumno on 10/30/17.
//  Copyright © 2017 Franti Saúl Huamán Mera. All rights reserved.
//

import Foundation

class Auto {
    
    var marca: String = "Desconocido"
    let modelo: String?
    let descripcion: String?
    
    init(marca: String, modelo: String?, descripcion: String?) {
        
        self.marca = marca
        self.modelo = modelo
        self.descripcion = descripcion
        
    }
    
    convenience init(marca: String) {
        //alguna lógica
        
        self.init(marca: marca, modelo: nil, descripcion: nil)
        
    }
    
    func encender() {
        print("encendido")
    }
    
    class func data() -> [Auto] {
        
        let a1 = Auto(marca: "Toyota", modelo: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tincidunt sit amet ex ac vehicula. Fusce vel pellentesque arcu, et finibus lectus.", descripcion: "Aenean vel ex arcu. Donec ac imperdiet ex, vitae congue velit. Suspendisse ut lacus scelerisque, accumsan lorem a, dignissim justo. Duis auctor mi ac elementum sagittis. Donec rhoncus dui vitae nibh dapibus bibendum. In ultricies leo mi, tincidunt condimentum nibh ornare ut. Cras vitae arcu vitae purus mattis commodo at facilisis diam. Fusce erat massa, porta ac sem eu, volutpat feugiat magna. Fusce accumsan, justo a dictum dapibus, augue risus ornare magna, consectetur suscipit purus urna et mauris. Ut dapibus ut nulla ut aliquet. Aenean fringilla libero diam.")
        
        let a2 = Auto(marca: "Nissan")
        
        let a3 = Auto(marca: "Audi", modelo: "Nulla lobortis hendrerit ex", descripcion: "Aenean lorem dolor, convallis a elementum sed, pulvinar quis elit. Aenean vehicula diam urna, ac iaculis nibh auctor et. Pellentesque eget nisl sed nisl suscipit interdum")
        
        return [a1, a2, a3]
        
        
    }

}
