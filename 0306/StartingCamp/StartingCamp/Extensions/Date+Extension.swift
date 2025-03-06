//
//  Date+Extension.swift
//  StartingCamp
//
//  Created by yimkeul on 3/6/25.
//

import Foundation

extension Date {
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: self)
    }
}
