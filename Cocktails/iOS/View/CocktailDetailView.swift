//
//  CocktailDetailView.swift
//  Cocktails (iOS)
//
//  Created by Petar Jadek on 16.08.2020..
//

import SwiftUI

struct CocktailDetailView: View {
    
    @ObservedObject var viewModel: CocktailDetailViewModel
    
    var body: some View {
        
        ForEach(viewModel.cocktails) { cocktail in
            
            ScrollView(.vertical, showsIndicators: false) {

                #if targetEnvironment(macCatalyst)
                
                RemoteImage(url: URL(string: cocktail.thumbnail)!)
                    .frame(
                        width: 300,
                        height: 300
                    )
                    .cornerRadius(Constants.UI.cornerRadius)
                    .padding()
                    
                
                #else
                
                RemoteImage(url: URL(string: cocktail.thumbnail)!)
                    .frame(
                        width: UIScreen.main.bounds.size.width,
                        height: UIScreen.main.bounds.size.width
                    )
                
                #endif

                VStack(alignment: .leading) {
                    
                    if let _alcoholic = cocktail.alcoholic {
                        Text(_alcoholic.uppercased())
                            .font(.caption)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, Constants.UI.paddingTag)
                            .background(Color.accentColor)
                            .cornerRadius(Constants.UI.cornerRadiusTag)
                            .padding(.bottom)
                    }

                    Text(cocktail.name)
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom)
                        .lineLimit(nil)

                    getTitle(label: Label.Detail.ingredients)
                    
                    CocktailIngredientsListView(cocktail: cocktail)

                    VStack(alignment: .leading) {
                        
                        getTitle(label: Label.Detail.instructions)

                        Text(cocktail.instructions!)
                        
                    }
                    .padding(.bottom)
                    
                    if let tags = cocktail.tags {
                        getTags(tags: tags.components(separatedBy: ","))
                    }

                    Spacer()
                }
                .padding()

            }
            .edgesIgnoringSafeArea(.top)
        }
    }
    
    
    private func getTitle(label: String) -> some View {
        
        return Text(label)
                .font(.title3)
                .bold()
                .padding(.bottom)
        
    }
    
    private func getTags(tags: [String]) -> some View {
        
        return VStack(alignment: .leading) {
            getTitle(label: Label.Detail.tags)
            
            HStack {
            
                ForEach((0..<tags.count)) { index in
                    
                    Text(tags[index])
                        .foregroundColor(.white)
                        .padding(.all, Constants.UI.paddingTag)
                        .background(Color.accentColor)
                        .cornerRadius(Constants.UI.cornerRadiusTag)
                    
                }
                
            }
            
            
            
        }
        
    }
    
}
