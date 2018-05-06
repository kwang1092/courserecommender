//
//  Network.swift
//  rl597_p6
//
//  Created by Robert Li on 4/20/18.
//  Copyright © 2018 Robert Li. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

class Network {
    
    private static let endpoint = "https://classes.cornell.edu/api/2.0/search/classes.json?roster=FA18"
    
    //&subject=CS
    
    static func getRecipes(withQuery query: String, _ completion: @escaping ([Recipe]) -> Void) {
        
        let parameters: Parameters = [
            "subject" : query,
            ]
        
        Alamofire.request(endpoint, parameters: parameters).validate().responseJSON { (response) in
            
            switch response.result {
                
            case .success(let json):
                
                let json = JSON(json)
                var recipes: [Recipe] = []
                
                for recipeJSON in json["results"].arrayValue  {
                    recipes.append(Recipe(from: recipeJSON))
                }
                
                completion(recipes)
                
            case .failure(let error):
                print("[Network] Error:", error)
                completion([])
                
            }
            
        }
        
        
    }
    
}



