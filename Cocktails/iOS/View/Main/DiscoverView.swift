//
//  Discover.swift
//  Cocktails (iOS)
//
//  Created by Petar Jadek on 12.08.2020..
//

import SwiftUI

struct DiscoverView: View {
    
    @ObservedObject var viewModel = DiscoverViewModel()
    
    @State var showingExperience = false

    var body: some View {
        
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: Constants.UI.spaceRegular) {
                    
                    _categories
                    
                    CocktailScrollList(
                        title: Label.Discover.popular,
                        cocktails: viewModel.popularCocktails,
                        spacing: Constants.UI.spaceSmall
                    )
                    
                    CocktailScrollList(
                        title: Label.Discover.latest,
                        cocktails: viewModel.latestCocktails,
                        spacing: Constants.UI.spaceSmall
                    )
                    
                    VStack(alignment: .leading) {
                        Text(Label.Discover.experience)
                            .font(.title2)
                            .bold()
                        
                        
                        ZStack(alignment: .bottom) {
                            Image(Label.Discover.experience)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: .infinity, height: Constants.UI.experienceImageHeight)
                                .cornerRadius(Constants.UI.cornerRadius)
                            
                            Button(
                                action: {
                                    self.showingExperience.toggle()
                            }) {
                                Text("8 Super Impressive New Skills You Can Learn While Stuck Inside")
                                    .foregroundColor(.black)
                                    .font(.title3)
                                    .bold()
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(Constants.UI.cornerRadius)
                            }
                            .padding(.bottom)
                            .sheet(isPresented: $showingExperience) {
                                ExperienceView()
                            }
                                    
                        }
                    }
                    .padding([.leading, .trailing, .bottom])
                    
                }
                
            }
            .navigationTitle(Label.Discover.title)

        }
        
    }

}

private extension DiscoverView {
    
    var _categories: some View {
        return
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    NavigationLink(destination: CategoryListView(viewModel: CategoryListViewModel())) {
                        Card(title: Label.Discover.categories)
                    }
                   
                    NavigationLink(destination: IngredientListView(viewModel: IngredientListViewModel())) {
                        Card(title: Label.Discover.ingredients)
                    }
                    
                    NavigationLink(destination: GlassListView(viewModel: GlassListViewModel())) {
                        Card(title: Label.Discover.glasses)
                    }
                    
                    NavigationLink(destination: AlcoholicListView(viewModel: AlcoholicListViewModel())) {
                        Card(title: Label.Discover.alcoholic)
                    }
               }
               .padding([.leading, .trailing])
            }
    }
    
    
}
