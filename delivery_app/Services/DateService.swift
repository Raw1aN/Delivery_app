//
//  DateService.swift
//  delivery_app
//
//  Created by Алексей Щукин on 02.07.2023.
//

import Foundation

class DateService{
    
    func getDate() -> String{
        let today = Date.now
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM, y"
        return formatter.string(from: today)
    }
    
}
