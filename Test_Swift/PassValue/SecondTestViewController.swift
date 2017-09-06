//
//  SecondTestViewController.swift
//  Test_Swift
//
//  Created by 冷求慧 on 2017/9/5.
//  Copyright © 2017年 Leng. All rights reserved.
//

import UIKit

typealias EasyClosure = (_ stringValue:String)->Void   // 定义一个闭包别名 EasyClosure

protocol SecondTestViewControllerDelegate:NSObjectProtocol {     // 定义一个协议 SecondTestViewControllerDelegate
    
    func passValueWithSecVC(_ string:String)->Void  // 协议中的方法就是去掉{}的函数
}

class SecondTestViewController: UIViewController {

    var yourValue:String?
    
    var easyWithProperty:EasyClosure?      // 将闭包定义成一个属性
    
    weak var delegatePro:SecondTestViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor=UIColor.red
        
        LogMsgWithDebug("属性传过来的值:\(String(describing: yourValue!))")
        
        createBackButton()
        
    }
    // MARK: 方法(函数传值)
    func funcPassValue(_ stringValue:String){
        
        LogMsgWithDebug("函数(方法)传过来的值:\(stringValue)")
    }
    
    // MARK: 创建返回按钮
    func createBackButton(){
        
        let backButton = UIButton.init(frame: CGRect.init(x: 60, y: 60, width: 120, height: 36))
        view.addSubview(backButton)
        backButton.setTitle("返回", for: .normal)
        backButton.setTitleColor(UIColor.white, for: .normal)
        backButton.backgroundColor=UIColor.darkGray
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        
    }
    func backAction(){
        
        if easyWithProperty != nil {      // 闭包回调
            easyWithProperty!("Iphone8")
        }
        
        if delegatePro != nil {         // 代理
            delegatePro?.passValueWithSecVC("I like eat apple!")
        }
        // 通知
        NotificationCenter.default.post(name: NSNotification.Name.init(notificationName), object: nil, userInfo: ["key":"我在这里等你"])
        
        self.dismiss(animated: true, completion: nil)
        
    }
    

}
