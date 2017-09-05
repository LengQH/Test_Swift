//
//  SonClass.swift
//  Test_Swift
//
//  Created by 冷求慧 on 2017/8/13.
//  Copyright © 2017年 Leng. All rights reserved.
//

import UIKit

class baseClass{         // 这就是一个基类,没有继承任何类
    
    var playString:String?
    var eatFood:String?
    
    func fatherMethod(someThing:String){
        print("父类中的方法:\(someThing)")
    }
    
}

class SonClass: baseClass {   // 继承于baseClass类的子类SonClass 通过:父类名去继承
    
    var drinkString:String?   // 我是子类特有的属性哦,父类的两个属性我也是可以用的
    
    override func fatherMethod(someThing: String) {   // 重写(override)父类中的方法
        
        playString=someThing;
        
        print("子类(SonClass)重写父类中的方法,玩(父类中的属性)的是:\(playString!)")
        
    }
    
}
