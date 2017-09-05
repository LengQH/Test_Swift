//
//  AppDelegate.swift
//  Test_Swift
//
//  Created by 冷求慧 on 2017/8/4.
//  Copyright © 2017年 Leng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window=UIWindow.init(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        window?.rootViewController=ViewController()   // 简单Swift3.0的使用(EasySwift)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}
    
    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}


}

