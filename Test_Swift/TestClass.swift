//
//  TestClass.swift
//  Test_Swift
//
//  Created by 冷求慧 on 2017/8/10.
//  Copyright © 2017年 Leng. All rights reserved.
//

import UIKit

struct  PersonDesc{
    
    var yourName:String
    var yourHobby:String
    var yourAge:Int
    
    //  subscript+(形参列表)+返回值+{ 里面返回类型值 }
    
    subscript(indexNumber:Int)->Int{   // 写法可以理解为函数的函数名直接变成关键字subscript,去掉了函数关键字func,其他照旧
        return yourAge-indexNumber;
    }
    subscript(name:String,hobby:String)->String{
        return "他的名字叫:"+name+","+"他的爱好是:"+hobby   // 直接拼接字符串
    }
}

class TestClass: NSObject {   // 继承于NSObject

    
    subscript(play:String,eat:Int)->String{
        
        // String(eat) 是将Int类型eat转为字符串
        
        return "在一个类中使用脚本下标,传进来的第一个参数值是:"+play+"第二个参数值是:"+String(eat);
    }
    
    
    
    // 在Swift中定义一个属性的时候如果没有初始化,那么必须在属性类型的后面加上一个?,表示可选
    // Swift中要求属性必须是要有初始值的,但是只要在构造方法中对属性进行了初始化,那么就不用写 ?
    
    var name:String?       // 定义三个属性,分别为 name hobby和age
    var hobby:String?
    
    /*
     如果定义一个"对象属性"那么后面可以加上 ? 但是如果定义一个"基本数据类型属性",那么建议直接赋值为 0
     因为super.init()方法在分配内存存储空间的时候,如果发现属性是一个对象,并且是一个可选类型,那么就会给
     这个属性分配存储空间。如果属性是一个基本数据类型,并且也是可选类型,那么super.init()不会给该属性分配空间
     */
    var age:Int=0
    
    // 如果自定义了构造方法,并且没有重写父类的构造方法,那么默认的构造方法就会失效
    override init() {    // 重写父类的构造方法
        
        self.name="诸葛亮"
        self.hobby="算计人"
        self.age=67
    }
    // 自定义构造方法,这个就是方法的重载了,swift中允许方法重载(重载:方法名相同,形参或返回值不同)
    init(name:String,age:Int,hobby:String){
        self.name=name
        self.age=age
        self.hobby=hobby
        
    }
    
    
    
    
    
}
