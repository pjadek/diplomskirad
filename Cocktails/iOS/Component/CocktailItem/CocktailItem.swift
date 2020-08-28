//
//  CocktailItem.swift
//  Cocktails (iOS)
//
//  Created by Petar Jadek on 14.08.2020..
//

import SwiftUI

struct CocktailItem: View {
    
    var cocktail: Cocktail
    
    var body: some View {
        
        NavigationLink(destination: CocktailDetailView(viewModel: CocktailDetailViewModel(with: cocktail._id))) {
        
            VStack(alignment: .leading) {
                
                RemoteImage(url: URL(string: cocktail.thumbnail)!)
                    .frame(
                        width: Constants.UI.cocktailImageSizeRegular,
                        height: Constants.UI.cocktailImageSizeRegular
                    )
                    .cornerRadius(Constants.UI.cornerRadius)
                    
                Text(cocktail.name)
                    .frame(width: Constants.UI.cocktailImageSizeRegular, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                    .font(.caption)
                    .foregroundColor(.primary)
                }
                
        }.padding([.top, .bottom])
        
    }
        
}


