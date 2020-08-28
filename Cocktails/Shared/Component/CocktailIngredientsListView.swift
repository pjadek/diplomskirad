//
//  IngredientListView.swift
//  Cocktails (iOS)
//
//  Created by Petar Jadek on 16.08.2020..
//

import SwiftUI

struct CocktailIngredientsListView: View {
    
    var cocktail: Cocktail
    
    var body: some View {
        
        VStack {
         
            if let ingredient = cocktail.ingredient1 {
                if ingredient.count > 2 {
                    makeIngredientListRow(ingredient: ingredient, measure: String(cocktail.measure1 ?? ""))
                    Divider()
                }
            }
            
            if let ingredient = cocktail.ingredient2 {
                if ingredient.count > 2 {
                    makeIngredientListRow(ingredient: ingredient, measure: String(cocktail.measure2 ?? ""))
                    Divider()
                }
            }
            
            if let ingredient = cocktail.ingredient3 {
                if ingredient.count > 2 {
                    makeIngredientListRow(ingredient: ingredient, measure: String(cocktail.measure3 ?? ""))
                    Divider()
                }
            }
            
            if let ingredient = cocktail.ingredient4 {
                if ingredient.count > 2 {
                    makeIngredientListRow(ingredient: ingredient, measure: String(cocktail.measure4 ?? ""))
                    Divider()
                }
            }
            
            if let ingredient = cocktail.ingredient5 {
                if ingredient.count > 2 {
                    makeIngredientListRow(ingredient: ingredient, measure: String(cocktail.measure5 ?? ""))
                    Divider()
                }
            }
            
            if let ingredient = cocktail.ingredient6 {
                if ingredient.count > 2 {
                    makeIngredientListRow(ingredient: ingredient, measure: String(cocktail.measure6 ?? ""))
                    Divider()
                }
                
            }
            
            if let ingredient = cocktail.ingredient7 {
                if ingredient.count > 2 {
                    makeIngredientListRow(ingredient: ingredient, measure: String(cocktail.measure7 ?? ""))
                    Divider()
                }
            }
            
            if let ingredient = cocktail.ingredient8 {
                if ingredient.count > 3 {
                    makeIngredientListRow(ingredient: ingredient, measure: String(cocktail.measure8 ?? ""))
                    Divider()
                }
            }
            
            if let ingredient = cocktail.ingredient9 {
                if ingredient.count > 2 {
                    makeIngredientListRow(ingredient: ingredient, measure: String(cocktail.measure9 ?? ""))
                    Divider()
                }
            }
            
            if let ingredient = cocktail.ingredient10 {
                if ingredient.count > 2 {
                    makeIngredientListRow(ingredient: ingredient, measure: String(cocktail.measure10 ?? ""))
                    Divider()
                }
            }
            
        }
        .padding(.bottom)
        
    }
    
    private func makeIngredientListRow(ingredient: String, measure: String) -> some View {
        
        return HStack {
            
            let encodedURL = ingredient.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
            let url = URL(string: "https://www.thecocktaildb.com/images/ingredients/\(encodedURL).png")!
            
            RemoteImage(url: url)
                .frame(
                    width: Constants.UI.cocktailImageSizeSmall,
                    height: Constants.UI.cocktailImageSizeSmall
                )
                .padding(.trailing)
            
            VStack(alignment: .leading, spacing: Constants.UI.spaceSmall) {
                
                Text(ingredient)
                
                if measure != "" {
                    Text(measure)
                        .font(.subheadline)
                        .foregroundColor(.accentColor)
                }
            }
            
            Spacer()
            
        }
        
    }
    
}
