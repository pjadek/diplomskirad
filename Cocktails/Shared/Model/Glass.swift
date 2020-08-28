//
//  Glass.swift
//  Cocktails
//
//  Created by Petar Jadek on 17.08.2020..
//

import Foundation

struct GlassResponse: Codable {
    
    let categories: [Glass]
    
    enum CodingKeys: String, CodingKey {
        
        case categories = "drinks"
        
    }
    
}

struct Glass: Codable, Identifiable {
    
    var id = UUID()
    let name: String
    
    enum CodingKeys: String, CodingKey {
        
        case name = "strGlass"
    }

}
