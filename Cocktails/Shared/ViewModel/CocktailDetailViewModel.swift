//
//  CocktailDetailViewModel.swift
//  Cocktails
//
//  Created by Petar Jadek on 15.08.2020..
//

import Foundation
import Combine

class CocktailDetailViewModel: ObservableObject {
    
    @Published var cocktails: [Cocktail] = []
    private var id: String
    private var cancellactionToken: AnyCancellable?
    
    init(with id: String) {
        self.id = id
        getCocktailById()
    }
    
}

//  MARK: - Extensions -

extension CocktailDetailViewModel {
    
    func getCocktailById() {
        
        let params = ["i": self.id]
        
        cancellactionToken = CocktailDB.requestCocktails(.lookup, params: params)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.cocktails = $0.cocktails
            })
    }
    
}
