//
//  PostService.swift
//  Clase1
//
//  Created by Admin on 11/24/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import Alamofire

class PostService {
    
    static func list(completion: @escaping (Any?, Error?) -> Void) {
        
        Alamofire.request("http://localhost:3000/posts").responseJSON {
            (response) in
            
            if let _ = response.error {
                completion(nil, response.error)
            }else {
                completion(response.result.value, nil)
            }
            
        }
        
    }
    
    static func new(text: String, completion: @escaping (Bool, Error?) -> Void) {
        
        let parameters = ["title": text, "author": "Franti"]
        
        Alamofire.request("http://localhost:3000/posts", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            if let _ = response.error {
                completion(false, response.error)
            }else {
                print(response.result.value)
                completion(true, nil)
            }
            
        }
        /*
        let parameters: Parameters = [
            "foo": [1,2,3],
            "bar": [
                "baz": "qux"
            ]
        ]
        
        // Both calls are equivalent
        Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters, encoding: JSONEncoding.default)*/
        
    }
    
}




