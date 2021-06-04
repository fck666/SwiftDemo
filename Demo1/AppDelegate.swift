//
//  AppDelegate.swift
//  Demo1
//
//  Created by 58 on 2021/5/28.
//

import UIKit

//@available(iOS 14.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window?.rootViewController = TabbarController()
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    
    
    
}

