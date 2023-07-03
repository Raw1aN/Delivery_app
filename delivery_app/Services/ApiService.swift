//
//  ApiService.swift
//  delivery_app
//
//  Created by Алексей Щукин on 01.07.2023.
//

import Foundation

enum ObtainCategoriesResult{
    
    case succes(categories: Categories)
    case failure(error: Error)
    
}

enum ObtainDishesResult{
    
    case success(dishes: Dishes)
    case failure(error: Error)
    
}

class ApiService{
    
    let sessionConfiguration = URLSessionConfiguration.default
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    func getCategories(completion: @escaping (ObtainCategoriesResult) -> Void){
        
        guard let url = URL(string: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54") else {
            return
        }
        
        session.dataTask(with: url) { [weak self] data, response, error in
            
            var result: ObtainCategoriesResult
            guard let strongSelf = self else { return }
            
            if error == nil, let parsData = data {
                guard let categories = try? strongSelf.decoder.decode(Categories.self, from: parsData) else { return }
                result = .succes(categories: categories)
            }
            else{
                result = .failure(error: error!)
            }
            
            completion(result)
            
        }.resume()
        
    }
    
    func getDishes(completion: @escaping (ObtainDishesResult) -> Void){
        
        guard let url = URL(string: "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b") else {
            return
        }
        
        session.dataTask(with: url) { [weak self] data, response, error in
            
            var result: ObtainDishesResult
            guard let strongSelf = self else { return }
            
            if error == nil, let parsData = data {
                guard let dishes = try? strongSelf.decoder.decode(Dishes.self, from: parsData) else { return }
                result = .success(dishes: dishes)
            }
            else{
                result = .failure(error: error!)
            }
            
            completion(result)
            
        }.resume()
        
    }
    
}
