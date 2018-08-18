//
//  AppDelegate.swift
//  BarzumMarket
//
//  Created by Nikolas Omelianov on 18.08.2018.
//  Copyright © 2018 Nikolas Omelianov. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let vc = ViewController(persistanceManager: PersistanceManager.shared)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }
 
}

