//
//  FirstTestViewController.swift
//  Test_Swift
//
//  Created by 冷求慧 on 2017/9/5.
//  Copyright © 2017年 Leng. All rights reserved.
//

import UIKit

let notificationName = "NotificationName"

class FirstTestViewController: UIViewController,SecondTestViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor=UIColor.orange
        
        createJoinButton()
        
        registerANotification()  // 注册一个通知
    
    }
    
    // MARK: 创建跳转按钮
    func createJoinButton(){
        
        let backButton = UIButton.init(frame: CGRect.init(x: 60, y: 60, width: 120, height: 36))
        view.addSubview(backButton)
        backButton.setTitle("跳转", for: .normal)
        backButton.setTitleColor(UIColor.white, for: .normal)
        backButton.backgroundColor=UIColor.darkGray
        backButton.addTarget(self, action: #selector(joinAction), for: .touchUpInside)
    }
    // MARK:跳转操作
    func joinAction(){
        let secVC=SecondTestViewController()
        
        secVC.yourValue="我喜欢听段子"           // 属性传值
        
        secVC.funcPassValue("我喜欢漂亮的女孩")  // 方法传值
        
        secVC.easyWithProperty={             // 闭包
            (stringValue:String)->() in
            LogMsgWithDebug("闭包传过来的值:\(stringValue)")
        }
        
        secVC.delegatePro=self               // 代理
        
        self.present(secVC, animated: true, completion: nil)
    }
    // MARK:代理方法传值
    func passValueWithSecVC(_ string: String) {
        
        LogMsgWithDebug("代理传过来的值:\(string)")
        
    }
    // MARK:注册通知
    func registerANotification(){
        
        NotificationCenter.default.addObserver(self, selector:#selector(notificationFunc(notifa:)), name: NSNotification.Name.init(notificationName), object: nil)
    }
    func notificationFunc(notifa:Notification){
       let keyValue = notifa.userInfo!["key"]
        LogMsgWithDebug("通知传过来的值:\(keyValue)")
    }
    
    // 相当于OC中的dealloc方法
    deinit {
        NotificationCenter.default.removeObserver(self)   // 移除通知
        
    }
}
