//
//  CocktailDB.swift
//  Cocktails (iOS)
//
//  Created by Petar Jadek on 15.08.2020..
//

import Foundation
import Combine

enum CocktailDB {
    
    static let apiClient = APIClient()
    static let baseURL = URL(string: "https://www.thecocktaildb.com/api/json/v2/9973533")!
}

enum APIPath: String {
 
    case popular = "/popular.php"
    case latest = "/recent.php"
    case lookup = "/lookup.php"
    case categories = "/list.php"
    case filter = "filter.php"
    case random = "/randomselection.php"
    case search = "/search.php"
    
}

// MARK: - Extensions -

extension CocktailDB {
    
    static func requestCocktails(_ path: APIPath, params: [String: String]? = nil) -> AnyPublisher<CocktailResponse, Error>  {
        guard
            var components = URLComponents(url: baseURL.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
        else {
            fatalError("Could not create URLComponent")
        }
        
        if let _params = params {
            for (key, value) in _params {
                components.queryItems = [URLQueryItem(name: key, value: value)]
            }
        }
        
        let request = URLRequest(url: components.url!)
        
        return
            apiClient
            .run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    static func requestCategories(_ path: APIPath, params: [String: String]? = ["c": "list"]) -> AnyPublisher<CategoryResponse, Error>  {
        guard
            var components = URLComponents(url: baseURL.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
        else {
            fatalError("Could not create URLComponent")
        }
        
        if let _params = params {
            for (key, value) in _params {
                components.queryItems = [URLQueryItem(name: key, value: value)]
            }
        }
        
        let request = URLRequest(url: components.url!)
        
        return
            apiClient
            .run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    static func requestIngredients(_ path: APIPath, params: [String: String]? = ["i": "list"]) -> AnyPublisher<IngredientResponse, Error>  {
        guard
            var components = URLComponents(url: baseURL.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
        else {
            fatalError("Could not create URLComponent")
        }
        
        if let _params = params {
            for (key, value) in _params {
                components.queryItems = [URLQueryItem(name: key, value: value)]
            }
        }
        
        let request = URLRequest(url: components.url!)
        
        return
            apiClient
            .run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    static func requestGlasses(_ path: APIPath, params: [String: String]? = ["g": "list"]) -> AnyPublisher<GlassResponse, Error>  {
        guard
            var components = URLComponents(url: baseURL.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
        else {
            fatalError("Could not create URLComponent")
        }
        
        if let _params = params {
            for (key, value) in _params {
                components.queryItems = [URLQueryItem(name: key, value: value)]
            }
        }
        
        let request = URLRequest(url: components.url!)
        
        return
            apiClient
            .run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    static func requestAlcoholic(_ path: APIPath, params: [String: String]? = ["a": "list"]) -> AnyPublisher<AlcoholicResponse, Error>  {
        guard
            var components = URLComponents(url: baseURL.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
        else {
            fatalError("Could not create URLComponent")
        }
        
        if let _params = params {
            for (key, value) in _params {
                components.queryItems = [URLQueryItem(name: key, value: value)]
            }
        }
        
        let request = URLRequest(url: components.url!)
        
        return
            apiClient
            .run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    static func requestFilter(_ path: APIPath, params: [String: String]) -> AnyPublisher<CocktailResponse, Error>  {
        guard
            var components = URLComponents(url: baseURL.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
        else {
            fatalError("Could not create URLComponent")
        }
        
        for (key, value) in params {
            components.queryItems = [URLQueryItem(name: key, value: value)]
        }
        
        let request = URLRequest(url: components.url!)
        
        return
            apiClient
            .run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    static func searchByKeyword(_ path: APIPath, params: [String: String]) -> AnyPublisher<CocktailResponse, Error>  {
        guard
            var components = URLComponents(url: baseURL.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
        else {
            fatalError("Could not create URLComponent")
        }
        
        for (key, value) in params {
            components.queryItems = [URLQueryItem(name: key, value: value)]
        }
        
        let request = URLRequest(url: components.url!)
        
        return
            apiClient
            .run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
}
