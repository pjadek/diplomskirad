//
//  SearchViewModel.swift
//  Cocktails (iOS)
//
//  Created by Petar Jadek on 26.08.2020..
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    
    @Published var randomCocktails: [Cocktail] = []
    private var cancellationRandom: AnyCancellable?
    
    @Published var cocktailsKeyword: [Cocktail] = []
    private var cancellationKeyword: AnyCancellable?
    
    @Published var cocktailsIngredient: [Cocktail] = []
    private var cancellationIngredient: AnyCancellable?
    
    @Published var keyword: String = ""
    
    init() {
        getRandomCocktails()
    }
    
    func getCocktailsByKeyword(_ keyword: String) {
        searchByKeyword(keyword)
    }
    
    func getCocktailsByIngredient(_ keyword: String) {
        searchByKeywordIngredient(keyword)
    }
    
}

// MARK: - Extensions -

extension SearchViewModel {
    
    private func getRandomCocktails() {
        cancellationRandom = CocktailDB.requestCocktails(.random)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.randomCocktails = $0.cocktails
            })
    }
    
    private func searchByKeyword(_ keyword: String) {
        let params = ["s": keyword]
        
        cancellationKeyword = CocktailDB.searchByKeyword(.search, params: params)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.cocktailsKeyword = $0.cocktails
            })
    }
    
    private func searchByKeywordIngredient(_ keyword: String) {
        let params = ["i": keyword]
        
        cancellationIngredient = CocktailDB.searchByKeyword(.search, params: params)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.cocktailsIngredient = $0.cocktails
            })
    }
    
}
