//
//  Cocktail.swift
//  Cocktails (iOS)
//
//  Created by Petar Jadek on 15.08.2020..
//

import Foundation

struct CocktailResponse: Codable {
    
    let cocktails: [Cocktail]
    
    enum CodingKeys: String, CodingKey {

        case cocktails = "drinks"

    }
    
}

struct Cocktail: Codable, Identifiable {
    
    var id = UUID()
    
    let _id: String
    let name: String
    let tags: String?
    let category: String?
    let alcoholic: String?
    let glass: String?
    let instructions: String?
    let thumbnail: String
    let ingredient1: String?
    let ingredient2: String?
    let ingredient3: String?
    let ingredient4: String?
    let ingredient5: String?
    let ingredient6: String?
    let ingredient7: String?
    let ingredient8: String?
    let ingredient9: String?
    let ingredient10: String?
    let measure1: String?
    let measure2: String?
    let measure3: String?
    let measure4: String?
    let measure5: String?
    let measure6: String?
    let measure7: String?
    let measure8: String?
    let measure9: String?
    let measure10: String?
    
    enum CodingKeys: String, CodingKey {
        
        case _id = "idDrink"
        case name = "strDrink"
        case tags = "strTags"
        case category = "strCategory"
        case alcoholic = "strAlcoholic"
        case glass = "strGlass"
        case instructions = "strInstructions"
        case thumbnail = "strDrinkThumb"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        
    }
}
