//
//  AlarmViewModel.swift
//  AlarmApp
//
//  Created by Zhassulan Aimukhambetov on 12/24/19.
//  Copyright © 2019 Zhassulan Aimukhambetov. All rights reserved.
//

import Foundation

class AlarmViewModel: AlarmViewModelProtocol {
    
    var alarms = [Alarm]()
    
    func numberOfRows() -> Int {
        return alarms.count
    }
    
    func getAlarmText(indexPath: IndexPath) -> String {
        let date = alarms[indexPath.row].date
        return date.getAlarmIdentifier(format: "HH:mm")
    }
    
    func getAlarmDate(indexPath: IndexPath) -> Date {
        let alarm = alarms[indexPath.row]
        return alarm.date
    }
    
    private let notification = Notification()
    
    func getAlarms() {
        alarms.removeAll()
        
        guard let identifiers = UserDefaults.standard.stringArray(forKey: "alarms") else { return }
        
        for identifier in identifiers {
            guard let date = identifier.getAlarmDate() else { return }
            let alarm = Alarm(date: date)
            alarms.append(alarm)
        }
    }
    
    func saveAlarms(date: Date) {
        let alarm = Alarm(date: date)
        notification.scheduleNotification(alarm: alarm)
        alarms.append(alarm)
        
        var identifiers = [String]()
        for alarm in alarms {
            identifiers.append(alarm.identifier)
        }
        
        UserDefaults.standard.set(identifiers, forKey: "alarms")
    }
    
    func deleteAlarm(indexPath: IndexPath) {
        let identifier = alarms[indexPath.row].identifier
        notification.notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        
        alarms.remove(at: indexPath.row)
        var identifiers = [String]()
        for alarm in alarms {
            identifiers.append(alarm.identifier)
        }
        UserDefaults.standard.set(identifiers, forKey: "alarms")
    }
}
