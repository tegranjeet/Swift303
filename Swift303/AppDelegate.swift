//
//  AppDelegate.swift
//  Swift303
//
//  Created by Eric Armstrong on 8/6/19.
//  Copyright © 2019 Eric Armstrong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {

    var window: UIWindow?
}

extension AppDelegate: UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = PeopleViewController()
        window?.makeKeyAndVisible()
        return true
    }
}
