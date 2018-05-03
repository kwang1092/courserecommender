//
//  Classes.swift
//  iOS Final Project
//
//  Created by Robert Li on 4/28/18.
//  Copyright © 2018 Robert Li. All rights reserved.
//

import Foundation
import UIKit

class Classes {
    var className: String
    var professor: String
    var rating: Double
    var classDescription: String
    
    init(className: String, professor: String, rating: Double, classDescription: String) {
        self.className = className
        self.professor = professor
        self.rating = rating
        self.classDescription = classDescription
    }
    
}
