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
    var dishesFiltered = Dishes(dishes: [])
    
    func getDishes(complition: @escaping () -> Void){
        
        apiService.getDishes { result in
            switch result{
            case .success(let success):
                self.dishes = success
                self.dishesFiltered = self.dishes
                complition()
            case .failure(error: let error):
                print(error)
                complition()
            }
            
        }
        
    }
    
    func filterDishes(filter: Int, complition: @escaping () -> Void){
        
        self.dishesFiltered = Dishes(dishes: [])
        var dishesResult = [Dish]()
        
        for item in dishes.dishes{
            for filterCategory in item.tegs{
                switch filterCategory{
                case .всеМеню:
                    if (filter == 0){
                        dishesResult.append(item)
                        break
                    }
                case .сРисом:
                    if (filter == 1){
                        dishesResult.append(item)
                        break
                    }
                case .сРыбой:
                    if (filter == 2){
                        dishesResult.append(item)
                        break
                    }
                case .салаты:
                    if (filter == 3){
                        dishesResult.append(item)
                        break
                    }
                }
            }
        }
        self.dishesFiltered = Dishes(dishes: dishesResult)
        complition()
        
    }
    
}
