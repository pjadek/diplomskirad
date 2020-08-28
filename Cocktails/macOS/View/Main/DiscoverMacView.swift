//
//  DiscoverMacView.swift
//  Cocktails (iOS)
//
//  Created by Petar Jadek on 27.08.2020..
//

import SwiftUI

struct DiscoverMacView: View {
    @ObservedObject var viewModel = DiscoverViewModel()
    
    @State var selectedCocktail = ""
    @State var cocktailId = ""
    
    public func makeCocktailCard(cocktail: Cocktail) -> some View {
        return VStack {
            RemoteImage(url: URL(string: cocktail.thumbnail)!)
                .frame(
                    width: Constants.UI.cocktailImageSizeRegular,
                    height: Constants.UI.cocktailImageSizeRegular
                )
                .cornerRadius(Constants.UI.cornerRadius)
            Text(cocktail.name)
                .frame(width: Constants.UI.cocktailImageSizeRegular, alignment: .leading)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(1)
        }
        .padding(.all, Constants.UI.spaceSmall)
    }
    
    var body: some View {
        
        let columns = [
            GridItem(.adaptive(minimum: Constants.UI.cocktailImageSizeRegular))
        ]
        
        HStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: Constants.UI.spaceRegular) {
                    
                    Text(Label.Discover.title)
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom)
                    
                    Text(Label.Discover.popular)
                        .font(.title)
                        .bold()
                        .padding(.bottom)
                    
                    LazyVGrid(columns: columns, spacing: Constants.UI.spaceLarge) {
                        ForEach(viewModel.popularCocktails) { cocktail in
                            ZStack {
                                
                                if selectedCocktail == cocktail.name {
                                    Rectangle()
                                        .cornerRadius(Constants.UI.cornerRadius)
                                        .foregroundColor(Color.accentColor)
                                        
                                    makeCocktailCard(cocktail: cocktail)
                                        .foregroundColor(.white)
                                    
                                } else {
                                    makeCocktailCard(cocktail: cocktail)
                                }
                            }
                            .onTapGesture {
                                selectedCocktail = cocktail.name
                                cocktailId = cocktail._id
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    
                    Text(Label.Discover.latest)
                        .font(.title)
                        .bold()
                        .padding(.bottom)
                    
                    LazyVGrid(columns: columns, spacing: Constants.UI.spaceLarge) {
                        ForEach(viewModel.latestCocktails) { cocktail in
                            ZStack {
                                
                                if selectedCocktail == cocktail.name {
                                    Rectangle()
                                        .cornerRadius(Constants.UI.cornerRadius)
                                        .foregroundColor(Color.accentColor)
                                        
                                    makeCocktailCard(cocktail: cocktail)
                                        .foregroundColor(.white)
                                    
                                } else {
                                    makeCocktailCard(cocktail: cocktail)
                                }
                                
                                
                            }
                            .onTapGesture {
                                selectedCocktail = cocktail.name
                                cocktailId = cocktail._id
                            }
                        }
                    }
                    .padding(.horizontal)
                
                        
                }
                .padding()
                
            }
            .frame(minWidth: 700)
            
            if selectedCocktail != "" {
                
                Divider()
                
                VStack(alignment: .center, spacing: 10) {
                    
                    HStack {
                        Spacer()
                        Text("Dismiss")
                            .foregroundColor(.accentColor)
                    }
                    .padding(.top)
                    .onTapGesture {
                        selectedCocktail = ""
                        cocktailId = ""
                    }
                    
                    CocktailDetailView(viewModel: CocktailDetailViewModel(with: cocktailId))
                        
                }
                .frame(width: 316)

            }
            

        }
        
    }

}
