//
//  CocktailsViewModel.swift
//  Cocktails (iOS)
//
//  Created by Petar Jadek on 15.08.2020..
//

import SwiftUI
import Combine

class DiscoverViewModel: ObservableObject {
    
    @Published var popularCocktails: [Cocktail] = []
    @Published var latestCocktails: [Cocktail] = []
    private var cancellationPopular: AnyCancellable?
    private var cancellationLatest: AnyCancellable?
    
    init() {
        
        getPopularCocktails()
        getLatestCocktails()

    }
    
}

//  MARK: - Extensions -

extension DiscoverViewModel {
    
    private func getPopularCocktails() {
        cancellationPopular = CocktailDB.requestCocktails(.popular)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.popularCocktails = $0.cocktails
            })
    }
    
    private func getLatestCocktails() {
        cancellationLatest = CocktailDB.requestCocktails(.latest)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.latestCocktails = $0.cocktails
            })
    }
    
}
