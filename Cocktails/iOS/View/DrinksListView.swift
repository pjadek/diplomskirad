//
//  DrinksListView.swift
//  Cocktails (iOS)
//
//  Created by Petar Jadek on 24.08.2020..
//

import SwiftUI

struct DrinksListView: View {
    
    @ObservedObject var viewModel: DrinksListViewModel
    
    #if targetEnvironment(macCatalyst)
    
    @State var selected = ""
    
    var body: some View {
        HStack {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading) {
                    Text(viewModel.title)
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom)
                    
                    ForEach(viewModel.drinks) { drink in
                        ListRowView(
                            title: drink.name,
                            image: RemoteImage(url: URL(string: drink.thumbnail)!)
                        )
                            .onTapGesture {
                                selected = drink._id
                            }
                    }
                    .navigationTitle(Label.Discover.categories)
                    .padding(.top)
                }
            }
            
            if selected != "" {
                Divider()
                
                CocktailDetailView(viewModel: CocktailDetailViewModel(with: selected))
            }
        }
        .padding(.top)
    }
    
    #else
    var body: some View {
        
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(viewModel.drinks) { drink in
                        
                    NavigationLink(destination: CocktailDetailView(viewModel: CocktailDetailViewModel(with: drink._id))) {
                        ListRowView(
                            title: drink.name,
                            image: RemoteImage(url: URL(string: drink.thumbnail)!)
                        )
                    }
                        
                }
                
            }
            .padding(.top)
            .navigationBarTitle(viewModel.title)
            
        }
        
    }
    #endif
 
}

