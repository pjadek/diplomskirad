//
//  Alcoholic.swift
//  Cocktails
//
//  Created by Petar Jadek on 17.08.2020..
//

import Foundation

struct AlcoholicResponse: Codable {
    
    let categories: [Alcoholic]
    
    enum CodingKeys: String, CodingKey {
        
        case categories = "drinks"
        
    }
    
}

struct Alcoholic: Codable, Identifiable {
    
    var id = UUID()
    let name: String
    
    enum CodingKeys: String, CodingKey {
        
        case name = "strAlcoholic"
    }

}
