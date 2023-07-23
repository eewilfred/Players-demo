//
//  AppDateFormater.swift
//  player-demo
//
//  Created by edwin wilson on 23/07/2023.
//

import Foundation

extension String {
    func convertToAppDateFormat() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "dd MMM yyyy"
            let outputDate = dateFormatter.string(from: date)
            return outputDate
        }
        
        return nil
    }
}
