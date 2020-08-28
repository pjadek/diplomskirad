//
//  DrinksListViewModel.swift
//  Cocktails (iOS)
//
//  Created by Petar Jadek on 24.08.2020..
//

import Foundation
import Combine

class DrinksListViewModel: ObservableObject {
    
    @Published var drinks: [Cocktail] = []
    @Published var title: String
    private var cancellactionToken: AnyCancellable?
    private var params = [String: String]()
    
    init(key: String, value: String) {
        self.params = [key: value]
        self.title = value
        getDrinks()
    }
    
}

//  MARK: - Extensions -

extension DrinksListViewModel {
    
    func getDrinks() {
        cancellactionToken = CocktailDB.requestFilter(.filter, params: params)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.drinks = $0.cocktails
            })
    }
    
}

