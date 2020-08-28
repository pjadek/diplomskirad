//
//  Ingredient.swift
//  Cocktails
//
//  Created by Petar Jadek on 17.08.2020..
//

import Foundation

struct IngredientResponse: Codable {
    
    let categories: [Ingredient]
    
    enum CodingKeys: String, CodingKey {
        
        case categories = "drinks"
        
    }
    
}

struct Ingredient: Codable, Identifiable {
    
    var id = UUID()
    let name: String
    
    enum CodingKeys: String, CodingKey {
        
        case name = "strIngredient1"
    }

}
