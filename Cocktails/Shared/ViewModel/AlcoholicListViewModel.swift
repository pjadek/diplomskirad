//
//  AlcoholicListViewModel.swift
//  Cocktails
//
//  Created by Petar Jadek on 17.08.2020..
//

import Foundation
import Combine

class AlcoholicListViewModel: ObservableObject {
    
    @Published var alcoholics: [Alcoholic] = []
    private var cancellactionToken: AnyCancellable?
    
    init() {
        getCategories()
    }
    
}

//  MARK: - Extensions -

extension AlcoholicListViewModel {
    
    func getCategories() {
        cancellactionToken = CocktailDB.requestAlcoholic(.categories)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.alcoholics = $0.categories
            })
    }
    
}
