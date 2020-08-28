//
//  HorizontalList.swift
//  Cocktails (iOS)
//
//  Created by Petar Jadek on 13.08.2020..
//

import SwiftUI

struct CocktailScrollList: View {
    
    var title: String
    var cocktails: [Cocktail]
    var spacing: CGFloat
    
    var body: some View {

        VStack(alignment: .leading, spacing: spacing) {
            Text(title)
                .font(.title2)
                .bold()
                .padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(cocktails) { cocktail in
                        CocktailItem(cocktail: cocktail)
                    }
                }
                .padding([.leading, .trailing])
            }
        }
        
    }
    
}
