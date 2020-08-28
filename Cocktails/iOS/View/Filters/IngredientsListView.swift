//
//  CategoryListView.swift
//  Cocktails
//
//  Created by Petar Jadek on 17.08.2020..
//

import SwiftUI

struct IngredientListView: View {
    
    @ObservedObject var viewModel: IngredientListViewModel
    
    #if targetEnvironment(macCatalyst)
    
    @State var selected = ""
    
    var body: some View {
        HStack {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading) {
                    Text(Label.Discover.ingredients)
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom)
                    
                    ForEach(viewModel.ingredients) { category in
                        ListRowView(title: category.name, image: makeImage(with: category.name))
                            .onTapGesture {
                                selected = category.name
                            }
                    }
                    .navigationTitle(Label.Discover.categories)
                    .padding(.top)
                }
            }
            
            if selected != "" {
                Divider()
                
                DrinksListView(viewModel: DrinksListViewModel(key: "i", value: selected))
            }
        }
        .padding(.top)
    }
    
    #else
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVStack(alignment: .leading) {
                ForEach(viewModel.ingredients) { category in
                    NavigationLink(destination: DrinksListView(viewModel: DrinksListViewModel(key: "i", value: category.name))) {
                        ListRowView(title: category.name, image: makeImage(with: category.name))
                    }
                        
                }
                    
            }
                
            }
            .navigationTitle(Label.Discover.ingredients)
            .padding(.top)
        
    }
    
    #endif
    
    private func makeImage(with ingredient: String) -> RemoteImage {
        let encodedURL = ingredient.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let url = URL(string: "https://www.thecocktaildb.com/images/ingredients/\(encodedURL).png")!
        
        return RemoteImage(url: url)
    }
    
}
