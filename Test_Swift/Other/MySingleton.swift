//
//  MySingleton.swift
//  Test_Swift
//
//  Created by 冷求慧 on 2017/8/13.
//  Copyright © 2017年 Leng. All rights reserved.
//

import UIKit


// 单例写法一(通过final static 以及 private)
final class MySingleton: NSObject {          // final:说明这个类或方法不能继承和重写
    
    static let shareSingleton=MySingleton()  // static:说明MySingleton为静态类,只读不能修改
    
    // 下面两种方法都是可以的
    
//    fileprivate override init() {}           // fileprivate:将init方法设置为只能本类中重载,不能外部重载
    
    private override init() {}               // private:将init方法设置为私有,不能被外部重载
    
}

// 单例写法二(通过静态属性的返回值就是私有类)

private let single=SingletonClass()           // 私有类

final class SingletonClass:NSObject{
    
    static var shareClass:SingletonClass{     // 静态属性 shareClass 的返回类(私有类)
        return single
    }
    
//    private override init() {}
    
    fileprivate override init() {}            // 不能将 fileprivate 改成 private 不然上面私有类初始化是失败的
    
}


// 单例写法三(通过静态属性的返回值就是一个结构体的参数值)
final class SingletonClassWithOther:NSObject{
    
    static var shareOther:SingletonClassWithOther{    // 静态属性 shareOther
        
        struct StartUse{
            static let sureValue:SingletonClassWithOther=SingletonClassWithOther()  // 结构体(StartUse)的参数是sureValue 对应的值是 类对象
        }
        
        return StartUse.sureValue                    // 静态属性的返回值就是结构体的一个参数值
    }
    
    private override init() {}    // 和写法一同理,可以将 private 改为 fileprivate
}

