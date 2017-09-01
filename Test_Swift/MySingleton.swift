//
//  MySingleton.swift
//  Test_Swift
//
//  Created by 冷求慧 on 2017/8/13.
//  Copyright © 2017年 Leng. All rights reserved.
//

import UIKit


// 单例写法一
final class MySingleton: NSObject {
    
    static let shareSingleton=MySingleton()
    
    private override init() {}
    
}

// 单例写法二
private let single=SingletonClass()
final class SingletonClass:NSObject{
    
    static var shareClass:SingletonClass{
        return single
    }
    
    fileprivate override init() {}
}


// 单例写法三
final class SingletonClassWithOther:NSObject{
    
    static var shareOther:SingletonClassWithOther{
        struct StartUse{
            static let sureValue:SingletonClassWithOther=SingletonClassWithOther()
        }
        return StartUse.sureValue
    }
    private override init() {}
}

