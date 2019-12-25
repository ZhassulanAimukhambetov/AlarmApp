//
//  AlarmViewModelProtocol.swift
//  AlarmApp
//
//  Created by Zhassulan Aimukhambetov on 12/24/19.
//  Copyright © 2019 Zhassulan Aimukhambetov. All rights reserved.
//

import Foundation

protocol AlarmViewModelProtocol {
    var alarms: [Alarm] { get }
    
    func numberOfRows() -> Int
    func getAlarmText(indexPath: IndexPath) -> String
    func getAlarmDate(indexPath: IndexPath) -> Date
    
    func getAlarms()
    func addAlarms(date: Date)
    func deleteAlarm(indexPath: IndexPath)
}
