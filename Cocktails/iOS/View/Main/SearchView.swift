//
//  SearchView.swift
//  Cocktails (iOS)
//
//  Created by Petar Jadek on 13.08.2020..
//

import SwiftUI

struct SearchView: View {
    
    @State private var keywords: String = ""
    
    @ObservedObject var viewModel = SearchViewModel()
    
    #if targetEnvironment(macCatalyst)
    
    @State var selectedCocktail = ""
    @State var cocktailId = ""
    
    fileprivate func cocktailGrid(_ cocktails: [Cocktail]) -> some View {
        let columns = [
            GridItem(.adaptive(minimum: Constants.UI.cocktailImageSizeRegular + 20 ))
        ]
        
        return LazyVGrid(columns: columns, spacing: Constants.UI.spaceLarge) {
            
            ForEach(cocktails) { cocktail in
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
    
    var body: some View {
        
        HStack {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading, spacing: Constants.UI.spaceRegular) {
                    
                    HStack {
                        HStack {
                            ZStack(alignment: .trailing) {
                                TextField("Type cocktail name or ingredient...", text: $keywords)
                                    .onChange(of: self.keywords, perform: { value in
                                        viewModel.getCocktailsByKeyword(value)
                                    })
                                
                                if (self.keywords != "") {
                                    
                                    Button(action: {self.keywords = ""}, label: {
                                        Image(systemName: "clear.fill")
                                    })
                                }
                            }
                            
                        }
                        .padding(Constants.UI.spaceSmall)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(Constants.UI.cornerRadiusTag)

                    }
                    .padding([.top, .leading, .trailing])
                    
                    if self.keywords != "" && viewModel.cocktailsKeyword.count + viewModel.cocktailsIngredient.count > 0 {
                        
                        LazyVStack(alignment: .leading) {
                            Text("Search Results for \"\(self.keywords)\"")
                                .font(.title2)
                                .bold()
                                .padding(.leading)
                                .padding(.bottom, Constants.UI.spaceSmall)
                            
                            Text("Found \(viewModel.cocktailsKeyword.count) Cocktails")
                                .font(.headline)
                                .bold()
                                .padding([.leading, .bottom])
                            
                            cocktailGrid(viewModel.cocktailsKeyword)
                            
                            cocktailGrid(viewModel.cocktailsIngredient)
                            
                            
                        }
                        .padding(.top)
                    } else {
                        
                        Text(Label.Search.random)
                            .font(.title)
                            .bold()
                            .padding()
                        
                        cocktailGrid(viewModel.randomCocktails)
                    }
                    
                    

                    Spacer()
                }
            
                
            }
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
    
    #else
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading, spacing: Constants.UI.spaceRegular) {
                    
                    HStack {
                        HStack {
                            ZStack(alignment: .trailing) {
                                TextField("Type cocktail name or ingredient...", text: $keywords)
                                    .onChange(of: self.keywords, perform: { value in
                                        viewModel.getCocktailsByKeyword(value)
                                    })
                                
                                if (self.keywords != "") {
                                    
                                    Button(action: {self.keywords = ""}, label: {
                                        Image(systemName: "clear.fill")
                                    })
                                }
                            }
                            
                        }
                        .padding(Constants.UI.spaceSmall)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(Constants.UI.cornerRadiusTag)

                    }
                    .padding([.top, .leading, .trailing])
                    
                    if self.keywords != "" && viewModel.cocktailsKeyword.count + viewModel.cocktailsIngredient.count > 0 {
                        
                        LazyVStack(alignment: .leading) {
                            Text("Search Results for \"\(self.keywords)\"")
                                .font(.title2)
                                .bold()
                                .padding(.leading)
                                .padding(.bottom, Constants.UI.spaceSmall)
                            
                            Text("Found \(viewModel.cocktailsKeyword.count) Cocktails")
                                .font(.headline)
                                .bold()
                                .padding([.leading, .bottom])
                            
                            ForEach(viewModel.cocktailsKeyword) { drink in
                                    
                                NavigationLink(destination: CocktailDetailView(viewModel: CocktailDetailViewModel(with: drink._id))) {
                                    ListRowView(
                                        title: drink.name,
                                        image: RemoteImage(url: URL(string: drink.thumbnail)!))
                                }
                                    
                            }
                            
                            ForEach(viewModel.cocktailsIngredient) { drink in
                                    
                                NavigationLink(destination: CocktailDetailView(viewModel: CocktailDetailViewModel(with: drink._id))) {
                                    ListRowView(
                                        title: drink.name,
                                        image: RemoteImage(url: URL(string: drink.thumbnail)!))
                                }
                                    
                            }
                            
                        }
                        .padding(.top)
                    } else {
                        
                        CocktailScrollList(
                            title: Label.Search.random,
                            cocktails: viewModel.randomCocktails,
                            spacing: Constants.UI.spaceSmall
                        )
                    }
                    
                    

                    Spacer()
                }
            }
            .navigationTitle(Label.Search.title)
            
        }.gesture(DragGesture().onChanged { _ in
            self.hideKeyboard()
        })
    }
    
    #endif
    
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
    
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
