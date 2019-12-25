//
//  Extension.swift
//  AlarmApp
//
//  Created by Zhassulan Aimukhambetov on 12/24/19.
//  Copyright © 2019 Zhassulan Aimukhambetov. All rights reserved.
//

import Foundation

extension Date {
    func string(format: String = "yyyy.MM.dd HH:mm") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    init(from dateString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd HH:mm"
        self = formatter.date(from: dateString) ?? Date()
    }
}
