//
//  Category.swift
//  Cocktails (iOS)
//
//  Created by Petar Jadek on 14.08.2020..
//

import Foundation

struct CategoryResponse: Codable {
    
    let categories: [Category]
    
    enum CodingKeys: String, CodingKey {
        
        case categories = "drinks"
        
    }
    
}

struct Category: Codable, Identifiable {
    
    var id = UUID()
    let name: String
    
    enum CodingKeys: String, CodingKey {
        
        case name = "strCategory"
    }

}
