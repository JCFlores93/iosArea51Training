//
//  PokemonListViewController.swift
//  Clase4
//
//  Created by Alumno on 11/10/17.
//  Copyright © 2017 Franti Saúl Huamán Mera. All rights reserved.
//

import UIKit

class PokemonListViewController: UICollectionViewController {
    
    var pokemons = [Any]()

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
                    if let o = dict["pokemon"] as? [Any] {
                        self.pokemons = o
                        
                        self.collectionView?.reloadData()
                        
                    }
                }
            }else  {
                print(error?.localizedDescription)
            }
            
        }
        task.resume()
        
    }

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as! PokemonCell
        
        let pokemonItem = pokemons[indexPath.row] as! [String: Any]
        let pokemon = pokemonItem["pokemon"] as! [String: Any]
        
        cell.pokemonName.text = pokemon["name"] as? String//"\(indexPath.row+1)"

        return cell
    }
}
