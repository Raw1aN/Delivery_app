//
//  CategoryViewModel.swift
//  delivery_app
//
//  Created by Алексей Щукин on 03.07.2023.
//

import Foundation

class CategoryViewModel{
    
    private let apiService = ApiService()
    var dishes = Dishes(dishes: [])
    let filters = ["Все меню","С рисом","С рыбой","Салаты"]
    
    func getDishes(complition: @escaping () -> Void){
        
        apiService.getDishes { result in
            switch result{
            case .success(let success):
                self.dishes = success
                complition()
            case .failure(error: let error):
                print(error)
                complition()
            }
            
        }
        
    }
    
}
