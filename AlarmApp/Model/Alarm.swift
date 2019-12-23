//
//  Alarm.swift
//  AlarmApp
//
//  Created by Zhassulan Aimukhambetov on 12/23/19.
//  Copyright © 2019 Zhassulan Aimukhambetov. All rights reserved.
//

import Foundation

struct Alarm {
    let date: Date
    var identifier: String {
        return date.getAlarmIdentifier()
    }
}

extension Date {
    func getAlarmIdentifier(format: String = "yyyy.MM.dd HH:mm") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

extension String {
    func getAlarmDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd HH:mm"
        return formatter.date(from: self)
    }
}
