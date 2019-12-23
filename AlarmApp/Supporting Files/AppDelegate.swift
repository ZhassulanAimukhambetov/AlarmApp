//
//  AppDelegate.swift
//  AlarmApp
//
//  Created by Zhassulan Aimukhambetov on 12/23/19.
//  Copyright © 2019 Zhassulan Aimukhambetov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var notification = Notification()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        notification.requestAutorization()
        notification.notificationCenter.delegate = notification
        return true
    }

}

