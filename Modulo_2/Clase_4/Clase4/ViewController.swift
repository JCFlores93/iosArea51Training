//
//  ViewController.swift
//  Clase4
//
//  Created by Alumno on 11/10/17.
//  Copyright © 2017 Franti Saúl Huamán Mera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        requestPokemon()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Request
    func requestPokemon() {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        let url = URL(string: "http://pokeapi.co/api/v2/type/3/")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) {
            (responseObject, response, error) in
            
            if let response = responseObject {
                
                let r = try! JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments)
                
                if let dict = r as? [String: Any] {
                    let poke = dict["pokemon"]
                    print(poke)
                }
                print(r)
            }else  {
                print(error?.localizedDescription)
            }

        }
        task.resume()
 
    }

}

