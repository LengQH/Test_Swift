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
//        window?.rootViewController=ViewController()   // Swift3.0简单的使用(EasySwift)
        
        window?.rootViewController=FirstTestViewController()   // 属性 函数(方法) 闭包 代理 通知传值
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}
    
    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}


}

