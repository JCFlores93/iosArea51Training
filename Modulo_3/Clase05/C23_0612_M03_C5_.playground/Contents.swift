//: Playground - noun: a place where people can play
/*
 import UIKit
 
 var str = "Hello, playground"
 */

//Closure
//s
import CoreData

//func dismiss(animated: Bool, completion: () -> Void) {
//}

func dismiss(animated: Bool, completion: (() -> Void)?) {
}

dismiss(animated: true, completion: nil)

/*
 func prueba(animated: Bool, completion: (Bool, Int) -> Void){
 }
 
 prueba(animated: true) { (<#Bool#>, <#Int#>) in
 <#code#>
 }
 */

dismiss(animated: true) {
    //Tareas
}
//------------------------------------------------------------------------------------//
var sumar = { (v1: Int, v2: Int) -> Int in
    return v1+v2
}

let p = sumar(10,5)


let sumarConUnSoloValor = sumar
sumarConUnSoloValor(10, 10)

func hacerOperacion(t1: Int, t2: Int, opera: (Int, Int) -> Int) -> Int{
    return opera(t1, t2)
}
let res = hacerOperacion(t1: 6, t2: 5, opera: sumar)

func obtener(context: (Any?) -> Void, resultado: (Bool, Error?) -> Void) {
    
}

obtener(context: { context in
}) {
    (success, error) in
}


class MagicalRecord {
    class func save(context: (NSManagedObjectContext?) -> Void, completion: (Bool, Error?) -> Void){
        //1.- Obtiene el contexto correcto
        context(nil)
        //2.- Entrega el resultado de la operacion
        completion(false, nil)
    }
}


MagicalRecord.save(context: { (context) in
    if let _ = context {
        let n = NSManagedObject(context: context!)
    }
    
}) { (success, error) in
    if let _ = error {
        print(error?.localizedDescription)
    } else{
        
    }
}

//Tuplas            retorno que puede tener un metodo
func leerRegistro() -> (Int, Int) {
    return (5,3)
}

let result = leerRegistro()

result.0
result.1

func ultimoUsuarioAgregado(date: Date) -> (name: String, age: Int, isregistrered: Bool) {
    return ("Saul", 30, true)
}

let user = ultimoUsuarioAgregado(date: Date())

user.name
user.age
user.isregistrered

var lista = [1,3,55,14,34]
var listaArray: [Int] = []

for n in lista {
    let r = n*2
    listaArray.append(r)
}

print(listaArray)

let l1 = lista.map { (number: Int) -> Int
    in
    return number*2
}

print("Lineas")
print(l1)
//Reduciendo
let l2 = lista.map { (number: Int) -> Int
    in
    return number*2
}

let l3 = lista.map { (number: Int) in
    return number*2
}

let l4 = lista.map { (number: Int) in
    number*2
}

let l5 = lista.map { number in number*2 }

let l6 = lista.map { $0*2 }
print(l6)

let filtered = lista.filter { (number: Int) -> Bool in
    return number > 30
}
print(filtered)

let filtered2 = lista.filter { $0>30}
print(filtered2)


//REDUCE 0 Valor Inicial
let stock = [5: 2.5, 10:25.5, 2:99.99]
let venta = stock.reduce(0) { (result, item) -> Double in
    return result + (item.value * Double(item.key))
}
print("Venta")
print(venta)

//10 es Valor Inicial
let l8 = lista.reduce(10) { (result, number) -> Int in
    return result + number
}
//Reduce
print(l8)


let f1x = lista.filter{$0 > 30}.reduce(0) { (result, number) -> Int in
    return result + number
}
//suma los ido 55, 34
print(f1x)

//flatMap
let container = [[2,5,19,23],[32,454,34]]

var unicoArray: [Int] = []
for array in container{
    unicoArray = unicoArray + array
}

print("flatMap")
print(unicoArray)

let flatArray = unicoArray.flatMap{(number: Int) -> Int? in
    return number
}

print(flatArray)



//Inscribete normal si te dije algo
let flat1 = unicoArray.flatMap { $0 }

let mensaje = ["Hola", "mundo", "swift"]
//mensaje.reduce("", +)
//let concatenado = mensaje.reduce(" ", +)
//print(concatenado)


//No sale

let mensajeFinal = mensaje.reduce("") { (result, word) -> String in
    return result + (result.count !=0 ? " ": "") + word
    //return result +" "+ word
}


print(mensajeFinal)

let sortedd = lista.sorte {(v1, v2) -> Bool in
    return v1 > v2
}

print(sortedd)


