//
//  ListViewModel.swift
//  Cocktails
//
//  Created by Petar Jadek on 17.08.2020..
//

import Foundation
import Combine

class IngredientListViewModel: ObservableObject {
    
    @Published var ingredients: [Ingredient] = []
    private var cancellactionToken: AnyCancellable?
    
    init() {
        getIngredients()
    }
    
}

//  MARK: - Extensions -

extension IngredientListViewModel {
    
    func getIngredients() {
        cancellactionToken = CocktailDB.requestIngredients(.categories)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.ingredients = $0.categories
            })
    }
    
}
