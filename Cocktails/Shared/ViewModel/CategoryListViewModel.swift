//
//  ListViewModel.swift
//  Cocktails
//
//  Created by Petar Jadek on 17.08.2020..
//

import Foundation
import Combine

class CategoryListViewModel: ObservableObject {
    
    @Published var categories: [Category] = []
    private var cancellactionToken: AnyCancellable?
    
    init() {
        getCategories()
    }
    
}

//  MARK: - Extensions -

extension CategoryListViewModel {
    
    func getCategories() {
        cancellactionToken = CocktailDB.requestCategories(.categories)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.categories = $0.categories
            })
    }
    
}
