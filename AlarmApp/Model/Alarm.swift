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
