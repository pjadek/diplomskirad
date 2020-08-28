//
//  GlassListViewModel.swift
//  Cocktails
//
//  Created by Petar Jadek on 17.08.2020..
//

import Foundation
import Combine

class GlassListViewModel: ObservableObject {
    
    @Published var glasses: [Glass] = []
    private var cancellactionToken: AnyCancellable?
    
    init() {
        getCategories()
    }
    
}

//  MARK: - Extensions -

extension GlassListViewModel {
    
    func getCategories() {
        cancellactionToken = CocktailDB.requestGlasses(.categories)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.glasses = $0.categories
            })
    }
    
}

