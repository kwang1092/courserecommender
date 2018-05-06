//
//  Recipes.swift
//  rl597_p6
//
//  Created by Robert Li on 4/20/18.
//  Copyright © 2018 Robert Li. All rights reserved.
//

import Foundation
import SwiftyJSON

class Recipe: NSObject {
    
    let name: String
    let ingredients: String
    
    let previewLink: URL?
    let storeLink: URL?
    
    init(name: String, ingredients: String, previewLink: URL, storeLink: URL) {
        self.name = name
        self.ingredients = ingredients
        self.previewLink = previewLink
        self.storeLink = storeLink
    }
    
    init(from json: JSON) {
        self.name = json["title"].stringValue
        self.ingredients = json["ingredients"].stringValue
        self.previewLink = json["previewUrl"].url
        self.storeLink = json["trackViewUrl"].url
    }
    
}

