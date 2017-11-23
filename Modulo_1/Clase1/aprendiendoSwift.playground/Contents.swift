//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//creamos una constante
let nombre = "Area51"
//nombre = "pepe"

//para crear una variable usamos var
var apellido = "trainig center"
apellido = "fllors ca"
//definimos clase y valor
let numeroDeLlantas:Int  = 3
var nombres: String = "jean carlo"

//Métodos
func nombreMetodo() {}
func metodoConParametro(parametro: String){}
//para devolver un valor
func retorno() -> Int { return 2 }
//
func miParametro(nombre: String, apellido: String)->String{return nombre+" "+apellido}
//v1 o conV2 es la vairable a usar
func sumar(v1 v:Int, conV2 q:Int){}

func sumar(_ v:Int, _ q:Int){}

//Optionals
var resultado:Int? = 10
resultado = 15
resultado = nil
resultado = 100

print(resultado)

//Dynamic Building
//solo funciona con variables optional
// _ apple lo creo para evitar crear variables adicionales
if let _ = resultado {
    print(resultado)
}else {
    //si es nulo entra a else
    //print(u)
    print("Valor nulo")
}

print(resultado!)





















