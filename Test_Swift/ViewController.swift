//
//  ViewController.swift
//  Test_Swift
//
//  Created by 冷求慧 on 2017/8/4.
//  Copyright © 2017年 Leng. All rights reserved.
//

import UIKit



extension Bundle{     // 写在类的外面,用关键字 extension 修饰,后面跟随着对应的类,然后在{}里面扩展
    
    func getSpaceName()->String{      // 扩展一个函数
        
        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""   // 返回的就是 命名空间
    }
    
    var useAddAParam:String?{     // 扩展一个属性
        
        get{
            print("我喜欢吃苹果(🍎)...")
            
            return "Hellow Word"
        }
        set{
            
        }
    }
}


protocol ViewControllerDelegate{     // ViewControllerDelegate:协议的名字
    
    var fight:String{ get set }      //  协议中的属性可读可写
    func proMethod(stringParam:String)->String    // 协议中的方法
    
    // mutating关键字作为函数的前缀，写在func之前，表示可以在该方法中修改它所属的实例及其实例属性的值。
    mutating func changeMethod(intValue:Int)
    
}

class ViewController: UIViewController,ViewControllerDelegate {
    
   // 遵守协议
    var fight: String = "打架"
    
    func proMethod(stringParam: String) -> String {
        print("协议中的参数值:\(stringParam)")
        return "协议拼接值:"+stringParam;
    }
    func changeMethod(intValue: Int) {  // 类方法前不需要加mutating,因为类是引用类型
        fight="小明和小米在"+fight+String(intValue)
        print(fight)
    }
    
    
    
    struct AboutMe{        //  AboutMe是结构体的名字,通过名字方法访问结构体成员
        
        // 直接定义定义的类型
//        var myName:String
//        var myHobby:String
//        var myAge:Int
//        var myHeight:Float
//        var aboutOther:String
        
//        // 给对应的类型初始化一个值
        var myName:String="冷求慧"
        var myHobby:String="看电影,欣赏美女"
        var myAge:Int=22
        var myHeight:Float=171.8
        var aboutOther:String="我来买单吧!"
        
        
    }
    
    enum DayWithWeak {     // DayWithWeak 是枚举的名字(类型)
        
        case Monday        // 星期一到星期天
        case Tuesday
        case Wednesday
        case Thursday
        case Friday
        case Saturday
        case Sunday
        
    }
    
    // 没有参数和没有返回值的闭包别名(NoActionName)
    typealias NoActionName = ()->Void
    //    typealias NoActionName = ()->()  // 简写
    
    // 有参数和没有返回值的闭包别名(AnyActionName)
    typealias AnyActionName = (_ param:String)->Void
    
    // 没有参数和有返回值的闭包别名(AnyBackValueName)
    typealias AnyBackValueName = ()->NSString
    
    // 有参数和有返回值的闭包别名(AllActionName)
    typealias AllActionName = (_ numberValue:Int,_ hobby:String)->String
    typealias AllActionName2 = (Int,String)->String   // 上面的简写
    
    
    var  useBlock:AnyActionName?   // 定义了一个闭包的属性,属性名字为useBlock
    
    
    // 在Swift中,如果在某个类中定义一个属性,那么这个属性是要初始化的,否则就是报错
    // 如果占用时不想初始化,那么可以在后面添加一个?号,可选类型
//    var nameStrng:String    // 这个不加问号(?)是会报错的
    
    var nameStrng:String?     // 定义一个可变字符串类型的属性 nameStrng
    
    var yourHobby:String?{
        
        get{
            return  nameStrng
        }
        set{
           print("设置的值:\(newValue)")
        }
    }
    
    var youAction:String?{
        
        didSet{
            print("设置值完毕:\(youAction)")
        }
    }
    
    
    // 懒加载数组
    // 懒加载的格式:定义变量前使用 lazy 关键字来修饰,后面通过赋值一个闭包
    // 注意点 1.必须使用 var 2.闭包后面必须跟上()
    
    lazy var arrAddValue:[String]={()->[String] in
        print("只进来一次, arrAddValue 中")
        return ["冷","李","王","胡","杨"]
    }()
    
    // 如果闭包用于懒加载,那么in之前的代码都可以删掉,包括in在内
    lazy var arrAddName:[NSString]={
        print("只进来一次, arrAddName 中")
        return ["降龙十八掌","九阴真经","六脉神剑","北冥神功","打狗棒法"]
    }()

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
//        self.easydefLetAndVar()        // 这里的self.都是可以去掉的,直接通过函数名去调用方法
//        self.easyChangeMathType()
//        self.easyUseBoolAndSwitchType()
//        self.easyUseOptional()
//        self.easyUseForAndWhileLoop()
//        self.easyUseTuples()
//        self.easyUseArray()
//        self.easyUseDictionary()
//        self.easyUseString()
        
        // 函数的调用: self.函数名 或者 直接函数名
//        self.paramFunction(num1: 22, string2: "Leng")
//        let backFuncValue=paramAndBackValueFunction(param1: "我在", param2: "这里")
//        print("返回的函数值:\(backFuncValue)")
    
//        self.easyUseClosePackage()
        
//        self.easyUseClosure("bobby", useClosure: {(intValue:Int,stringValue:String)->String in
//            print("回调传过来的名字:\(stringValue) 年龄是:\(intValue)")
//            return stringValue
//        }, 22)
        
        
        
//        // 以后再Swift开发中,能不写self就不写self,但是在闭包中必须写self
//        // 所以以后看到self基本都是和闭包有关系,所以上面的通过self.去调用本类的函数中的self.都是可以去掉的
//        
//        weak var lowSelf=self;
//        self.easyUseLoopClosure{ (stringValue:String)->() in
//            
//            print("回调传过来的值:\(stringValue)")
//            
////            self.view.backgroundColor=UIColor.red     // 这里面一定要写self,因为这是闭包中,但是这样写的话会造成循环引用
//            
////            lowSelf?.view.backgroundColor=UIColor.red // ?是可选类型
//            
//            lowSelf!.view.backgroundColor=UIColor.red   // !是强制解析哦,之前讲了
//            
//        }
        
//        easyUseEnum()        // 直接通过函数名调用函数,去掉了self.
        
//        easyUseStruct()
        
//        easyUseProperty()
        
//        easyUseSubscript()
        
//        easyUseInherit()
        
//        easyUseTypeChange()
        
//        easyUseLazyLoad()
        
//        easyUseOverRide()
        
//        easyUseStringLoadViewController()
        
//        easyUseExtension()

        easyUseProtocol()
        
        
    }
    // MARK: 简单的定义常量和变量
    private func easydefLetAndVar(){
        
        let sureValue = "Hello word"               // 定义一个常量字符串
        //sureValue="修改就会报错,所以要删除这句代码"
        
        var changeValue = 1024        // 定义一个Int类型的变量
        changeValue = 1080
        
        print("常量值:\(sureValue) 变量值:\(changeValue)")
        
        
        let 常量名="Apple"
        
        var 变量名="Miscrosoft"
        变量名="Google"
        
        print("常量值是:\(常量名) 变量值是:\(变量名)")
        
    }
    // MARK: 转换数据类型
    private func easyChangeMathType(){
        
        let sureValue = "Hello word"
        let nextValue = "_我🙄你_"
        let intNumberStart = 100     // 定义一个Int类型的常量
        let intNumberEnd = 110
        let doubleNumber = 99.9
        
        let addIntNumber = intNumberStart+intNumberEnd   // 拼接相同数据类型
        let addString=sureValue+nextValue
        
        let transformValueToInt=intNumberStart+Int(doubleNumber)   // 数据类型的转换(这三种写法都可以)
        let transformValueToDouble:Double=doubleNumber+Double(intNumberEnd)
        let transformValueToFloat:(Float)=Float(intNumberStart)+Float(intNumberEnd)
        //let errorWayOne=intNumberStart+(Int)doubleNumber   // 错误的写法
        
        print("拼接的Int类型的值:\(addIntNumber) 拼接的String类型的值:\(addString) 转换成Int类型的值:\(transformValueToInt)  转换成Double类型的值:\(transformValueToDouble)  转换成Float类型的值:\(transformValueToFloat) ")
        
    }
    // MARK: 简单的使用Bool和Switch类型
    private func easyUseBoolAndSwitchType(){
        let boolNum=12
        
        if(boolNum==12){            // 条件中的()可要可无
            print("等于12")
        }
        if boolNum>=12{
            print("大于等于12")
        }
        //if boolNum==12 print("等于12")     // 错误的写法
        //if (boolNum==12) print("等于12")
        

        // Swift中的Switch 后面的()可以省略掉,
        // 在OC中的Switch如果没有break会穿透,但是在Swift中是不会的
        // OC中如果要在case中间定义变量,必须加上 {} 确定作用域,而在Swift中是不用的
        // 在OC中default的位置是可以随便写的,只有所有的条件不满足才会执行default,但是在Swift中的default只能放在最后面
        // OC中的default可以省略,但是在Swift中大部分是不能省略的
        
        let intValue=1024
        
        switch intValue {
        case 0:
            print("0")
        case 1024:
            print("1024")
        default:
            print("默认值")
        }
        
    }
    // MARK:简单的使用三目运算符和Optional类型
    private func easyUseOptional(){
        
        // 三目运算符中的?前后一定要用空格空开,不然会报错
        
        let showValue=(1>2) ? "1大于2":"1小于2"
        //let showErrorValue=(1>2)?"1大于2":"1小于2"  // 错误的写法,? 没有用空格隔开
        
        print("打印的值是:\(showValue)")
        
        
        // Option 是一种可选类型,代表的是可有可无,就像OC中的代理方法可以设置为Option一样
        // 以后凡是看到一个方法和数据类型后面有?的,就是代表的是一个可选类型(Option),创建出来的对象就有可能为nil
        
        let sureURL=NSURL(string:"www.baidu.com")
        let errorURL=NSURL(string:"www.baidu.com百度")   // 中文URL乱码
        
        print("中文URL 这里面的对象为空:\(errorURL)")
        
        
        // 使用可选类型需要注意,如果直接打印可选类型,那么打印出来的值是会被Optional包裹,
        // 如果我们使用过程中遇到可选类型,可以通过使用!强制解析,告诉编译器可选类型一定有值(直接在对象后面加!)
        // 但是如果我们强制解析,而可选类型没有值的话,那么程序就会奔溃
        
        //print(sureURL)      // 打印可选类型,后面有Optional
        print(sureURL!)     // 强制解析解析可选类型,不会更随Optional
        
        if sureURL != nil{       // 如果sureURL对象不等于空  != 前后一定要加空格隔开,不然报错
            print("sureURL 对象不为空")
        }
//        let changeError=errorURL!   // 强制解析为空的可选类型,程序在这里奔溃,放开注释即可
        
    }
    // MARK: 简单的使用for和while循环
    private func easyUseForAndWhileLoop(){
        
        //for var i = 0;i < 5;i++    // 这种写法在Swift 3.0中是错误的 在其他的版本是可以的
        //{
        //
        //}
        
        // 0..<6 代表的是一个区间范围[0,6), 从0-6 包含头不包括尾部(0-5)
        
        for i in 0..<6{
            print("不包括尾部的for循环,下标是:\(i)")
        }
        //for i in 0..<=5 {  // 错误的写法,去除=号即可
        //}
        //for i in 0..6 {  // 错误的写法,一定要加上一个 <
        //
        //}
        
        // 10...16 代表的是一个区间[10,16], 从 10-16 包含了尾部
        for q in 10...16{
            print("包括尾部的for循环,当前的下标是:\(q)")
        }
        
        // _ 代表的是忽略,如果不关心某个参数,就可以直接使用,这个在Swift开发中使用频率很高的
        
        for _ in 20...23{
            print("直接忽略的循环")
        }
        
        // Swift中的while循环和OC的差不多,而且在实际开发中很少使用到while
        
        var conValue=0
        while conValue < 5 {
            print("whil循环对应的值: \(conValue) ")
            
            //    conValue++          // 在Swift3.0中这种写法是错误的
            
            conValue+=1
        }
        
        // 在Swift升级到2.0之后, do while发生了很大的变化
        // do while中的do没有了,因为do被用作捕获异常了
        
        var startValue=0
        repeat{
            print("Swift中的 do_while \(startValue)")
            //    startValue++    // 在Swift3.0中这种写法是错误的
            
            startValue+=1     // 不加这句代码一直死循环
            
        }while startValue<3
        
    }
    // MARK: 简单的使用元组
    private func easyUseTuples(){
        
        // 元组(tuples)把多个值组合成一个复合值。元组内的值可以使任意类型,并不要求是相同类型,像C语言中的结构体
        
        let sureTup=(12,"120")   // Int类型和String类型
        print("简单的元组中的值:\(sureTup)")
        print("元组中的第一个值是:\(sureTup.0) 第二个值:\(sureTup.1)")  // 通过下标访问元组中的元素
        
        let (startIndex,endIndex)=(100,200)     // 可以将元组分解成单独的常量和变量
        print("开始的下标:\(startIndex) 和结束的下标:\(endIndex)")
        
        let otherTueWay=(keyString:"我年龄",key:22)  // 定义元组的时候给单个元素命名,通过元素的命名取出对应的值
        print("first值:\(otherTueWay.keyString) next值:\(otherTueWay.key)")
        
        let (sureValue,_,nextValue) = (1024,1000,20)  // 如果你只需要一部分元组值,分解的时候可以把要忽略的部分用下划线_标记:
        print("确定的值:\(sureValue) 接下来的值:\(nextValue)")
        
        
        
    }
    // MARK: 简单的使用数组
    private func easyUseArray(){

        // Swift中的数组和OC中的区别就是:去掉前面的@符号
        let arrVaue=["你你你","我我我","他他他","谁谁谁"]    // 定义一个不可变数组,里面的元素都是String类型
        print("数组里面的值:\(arrVaue)")
        
        // 利用元组遍历数组
        for (indexNumber,outputValue) in arrVaue.enumerated(){
            print("下标值是: \(indexNumber) 数组里面的值是: \(outputValue)");
        }
        // 反向遍历数组(在后面添加一个reversed()方法)
        for (indexNumber,outputValue) in arrVaue.enumerated().reversed() {
            print("下标值是: \(indexNumber) 数组里面的值是: \(outputValue)");
        }
//        // 下面是我原来OC的错误的想法(OC的格式)
//        for r in 0..<arrVaue.count {
//            arrVaue.index(of: <#T##String#>)
//            print("数组里面的值:\(arrVaue) i的值\(r)")
//        }
        
    }
    // MARK: 简单的使用字典
    private func easyUseDictionary(){
        
        // Swift中的字典创建和创建数组一样,都是用[]
        // [String:NSObject] 类型是IOS开发中最常见的一种格式
        
        var dicValue=["明星一":"李冰冰","明星二":"高圆圆"]   // 创建一个可变的字典
        print("字典里面的值\(dicValue)")
        
        // 通过元组遍历字典
        for (keyValue,outputValue) in dicValue{
            print("遍历字典的键是:\(keyValue) 值是:\(outputValue)")
        }
        // 下面是错误的遍历方法(这个是遍历数组的方法)
        for (keyValue,outputValue) in dicValue.enumerated(){
            print("错误遍历字典的键是:\(keyValue) 值是:\(outputValue)")
        }
        dicValue["明星三"]="王丽坤"              // 新增一个键值
        print("新增后字典里面的值\(dicValue)")
        
        dicValue["明星二"]="林允儿";            //  更新一个值
        print("更新后字典里面的值\(dicValue)")
        
        dicValue.removeValue(forKey:"明星一")   // 通过key移除值
        print("移除后字典里面的值\(dicValue)")
        
        let dicWithFriend=["同学一":"王大仙","明星一":"金喜善","明星三":"宋慧乔","同学二":"胡二狗"]
        for (keyValue,outputValue) in dicWithFriend{   // 合并两个字典通过 元组
            dicValue[keyValue]=outputValue
        }
        print("合并后的字典值:\(dicValue)")
    }
    // MARK: 简单的使用字符串
    private func easyUseString(){
        
        // 在Swift中使用 "" 定义字符串,在OC中字符串的类型是NSString,而在Swift中却是String
        // 在OC中字符串是一个对象,继承于NSObject,而在Swift中字符串是一个结构体,所以其性能要比OC中的强
        
        let sureString="快到碗里来!"
        var changeString="嘿,美女,"
        changeString=changeString+sureString   // 直接拼接字符串
        print("直接拼接字符串的最终值: \(changeString) ")
        
        let vivoADString="照亮你的美！"
        let linkString="vivo-\(vivoADString)"  // 在Swift中通过使用 \() 来拼接其他的值
        print(linkString)
        
        let formatString=String(format:"%02d: %02d: %02d",arguments: [9,8,13])  // 所有的值必须放在数组中,哪怕只有一个值
        print("对应的格式是[\(formatString)]")
        
        // 在Swift中如果需要截取对应的字符串,使用OC的字符串的方法来截取,因为其本身用起来很不爽
        let ocString:NSString="开始测试使用截取字符串"
        let subString=ocString.substring(with: NSMakeRange(2, 4))  // 直接使用OC的方法截取字符串
        print("截取对应的值是:\(subString)")
        
        let swiftToOCString="Swift结构体类型字符串(String)转为OC的对象字符串(NSString)" as NSString  // String转为NSString 通过 as
        let ocToSwiftString=ocString as String    // NSString 转为 String (通过Optional+click键查看类型)
        
        // swift中的字符串是可以直接遍历的
        let readEachValueFromString="遍历字符串"
        for value in readEachValueFromString.characters{
            print("对应的值是:\(value)")
        }
    }
    
    
    // 函数的定义: func +函数名字(参数名:参数类型,参数名:参数类型,) -> 返回类型{}
    
    // MARK: 定义一个没有返回值和没有参数的函数
    func say1() -> Void {   // 如果函数没有返回值,就写Void
    }
    func say2() -> () {     // 通过使用 () 代替 Void
    }
//    func say2() -> {  // 这个相对方法二来说是错误的写法,后面一定要添加 ()
//    }
    func say3() {          // 可以直接省略掉 -> () 和 -> Void
        
        print("say3")
    }

    // MARK: 定义一个没有返回值和有参数的函数
    func paramFunction(num1:Int,string2:String){
        print("参数整形类型的值是:\(num1) 参数字符串类型的值是:\(string2)")
    }
    
    // MARK: 定义有返回值和没有参数的函数
    func backValeFunction() -> String{
        return "有返回值和没有参数的函数"
    }
    
    // MARK: 定义一个有返回值和有参数的函数
    func paramAndBackValueFunction(param1:String,param2:String)->String{
        return param1+param2
    }
    // MARK: -简单的使用闭包
    func easyUseClosePackage(){
        
        // 闭包和OC中的Block是很相似的,OC中的Block是匿名的函数
        // 在Swift中的闭包也是用来定义一个函数回调用的,所以也是一个函数哈
        
        // 闭包的基本格式: { (形参列表) -> 返回值 in 需要执行的代码 }   // in 的含义是用于区分形参返回值和执行代码

        // 例子 { (a:Int,b:Int)->Int in return a+b  }
       /* 
         1. 将闭包通过实参传递给函数
         2. 如果闭包是函数的最后一个参数,那么闭包可以写在函数()的后面
         3. 如果函数只接受一个参数,并且这个参数是一个闭包,那么()后面的都可以省略
         4. 如果一个闭包没有返回类型,那么可以用()代替
         5. 如果一个闭包没有形参也没有返回值,那么 (形参列表) -> 返回值 in 都可以省略
       */

//         self.sureAPackage() 是调用函数 myOperation: 是闭包名字 {里面的格式}是闭包的格式
        self.sureAPackage(myOperation:) {  // 验证的是最原始的写法
            ()->Void in
            print("最原始的方法,闭包的回调")
        }
        self.sureAPackage(){               // 验证的是 2.的写法
            ()->Void in
            print("写法二,闭包的回调")
        }
        self.sureAPackage() {
            ()->() in
            print("写法三,闭包的回调")
        }
        self.sureAPackage {                // 验证的是 3.和 5.的写法
            print("最爽的写法,闭包的回调")
        }
        
        // 调用函数 self.loadDataOperation(param: finished: number: )
        // 闭包的固定格式 { (intValue:Int, stringValue:String) in 打印操作 } 
        
        self.loadDataOperation(param: "Apple", finished: { (intValue:Int, stringValue:String) in
            print("回调的价格值:\(intValue) 品牌值:\(stringValue) ")
        }, number: 5388)
        
        
        // Swift中函数是可以重载的,闭包后面的参数是可以随便定义的,就像我这里的 intPlay 和 stringPlay 一样
        let funcBackStringValue=self.loadDataOperation(play: { (intPlay:Int, stringPlay:String) in
            print("执行了玩的回调操作")
        }, eat: "西瓜,荔枝", write: { (floatValue:Float, intValue:Int) -> Int in
            
            print("回调Wirite永远不会执行")
            return 404
            
        }, drink: 350, goAction: { (paramString:String, paramValue:String) -> String in
            
            print("美国\(paramString),法国\(paramValue)")
            return paramString+paramValue;
        })
        print("函数的返回值:\(funcBackStringValue)")
        
    }
    
    // 定义就一个参数为闭包(没有参数和返回值)的函数
    func sureAPackage(myOperation:()->Void){
        print("先进来 sureAPackage 函数里面")
        myOperation() // 执行回调
    }
    
    // 函数中包含多个参数和一个闭包
    // finished 是闭包名字 分别传入Int 和 String 类型的值,并且没有返回类型
    func loadDataOperation(param:String,finished:(_ numOne:Int,_ stringValue:String)->Void,number:Int){
        
        print("传进来的值:\(param) 价格是:\(number)")
        
        finished(number,param)    // 通过闭包名执行回调
    }
    
    // 这里头有三个闭包, play write 和 goAction 其中 函数最后面的两个->String分别是函数和闭包的返回值类型(String)
    func loadDataOperation(play:(_ grade:Int,_ desValue:String)->Void,eat:String,write:(_ pageNumber:Float,_ numbeValue:Int)->Int,drink:Int,goAction:(_ buyAction:String,_ takeAction:String)->String)->String{
        
        print("第二个闭包 write 我不执行,传进来的吃的是:\(eat) 喝的是:\(drink)")
        
        play(87,"成绩还是可以的")
        
//        write(3.1415926,110)  // 不执行write回调
        
        goAction("自由女神","埃菲尔铁塔")
        
        return "这个是函数的返回值,不是闭包的哦"
    }
    // MARK: 使用闭包别名
    func easyUseClosure(_ name:String,useClosure:AllActionName2,_ age:Int){
        print("你的名字:\(name)")
        
        useClosure(age,name) // 执行回调
        
//        useClosure={}
    }
    // MARK: 闭包的循环引用
    private func easyUseLoopClosure(name:@escaping AnyActionName){
        self.useBlock=name;
        name("Miscrosoft")
        
    }
    // MARK: 简单的使用枚举
    func easyUseEnum(){
        
        let enumValue=DayWithWeak.Monday
        
        switch enumValue {    // 在Swift中不用Break不会发生穿透,但是default:一定要写在最后面
            
        case .Monday:         // 一定要加上一个 .
            print("星期一")
            
        case .Tuesday:
            print("星期二")
            
        case .Wednesday:
            print("星期三")
            
        case .Thursday:
            print("星期四")
            
        case .Friday:
            print("星期五")
            
        case .Saturday:
            print("星期六")
    
        default:
            print("星期天")
        }
        
    }
    // MARK: 简单的使用结构体
    func easyUseStruct(){
        
        let defaultMe=AboutMe();   // 我上面给了默认的值,所以可以直接调用(直接初始化了)
        print("默认的我的名字:\(defaultMe.myName) 我的爱好:\(defaultMe.myHobby)")
        
//  如果结构体没有初始化对应的各个值,那么只能通过下面的init方法去赋对应的值,然后去访问其成员。如果有,就可以通过上面的代码直接访问其成员
//  因为我上面的定义中初始化给了值,所以上下的代码都是可以调用其成员的

        // AboutMe.init 是初始化结构体
        let ming=AboutMe.init(myName: "小明", myHobby: "顶老师", myAge: 16, myHeight: 162.8, aboutOther: "打游戏");
        print("小明的爱好:\(ming.myHobby) 和身高:\(ming.myHeight)")
        
    }
    // MARK: 使用属性
    func easyUseProperty(){
        
        nameStrng="属性赋值"   // 这里可以不用self.
        
        print("属性值是:\(nameStrng)")   // 因为上面定义用了?(可选类型), 所以打印一定有 Optional
        
        print("get方法 得到的值:\(yourHobby)")    // 这里面走的是 get 方法,但是我这里是重写了 get 方法,所以其值是 Optional("属性赋值")
        
        
        yourHobby="Hello,word !"
        
        print("get方法 得到的值:\(yourHobby)")  // 和上面一样,走的是 get 方法 其值永远是: Optional("属性赋值")
        
        youAction="游泳"
    }
    // MARK: 简单的使用下标脚本
    func easyUseSubscript(){
        
        // 初始化结构体
        let struceDesc=PersonDesc.init(yourName: "赵云", yourHobby: "吾乃常山赵子龙是也!", yourAge: 28)
        
        let subIndexValue=struceDesc[10];          // 使用下标脚本
        let hisDes=struceDesc["吕布","貂蝉是我的!"]
        
        print("十年前的他是:\(subIndexValue)岁")
        print("结构体中使用下标脚本返回的值:\(hisDes)")
        
        let testClass=TestClass.init();                 // 使用下标脚本一定要先初始化,然后再调用
        let backStringValue=testClass["学无止境",22];    //  可以将下标脚本理解为一种特殊的函数
        
        print("类中使用下标脚本返回的值:\(backStringValue)")

        
    }
    // MARK: 简单的使用继承
    func easyUseInherit(){
        
        let baseWithInit=baseClass.init();   // 初始化基类
        baseWithInit.eatFood="🍎的味道-酸甜"
        print("基类中的吃的属性值:\(baseWithInit.eatFood!)")  // !是强制解析可选(Option)值
        
        let sonClass=SonClass.init()
        sonClass.fatherMethod(someThing: "老铁,玩🐍")  // 调用重写的父类的方法
    }
    // MARK: 简单的使用类型的转换
    func easyUseTypeChange(){
        
        let sonClass=SonClass.init();
        let grandClass=Grandson.init();
        grandClass.playString="玩手机"
        
        // is as! 还有 as?后面一定是一个类的类型
    
        if sonClass is baseClass {  //  is:检查sonClass是否是baseClass类型(true,因为继承)
            print("是其子类")
        }
        let newObj=grandClass as! SonClass   // as? 是不确定转为某个类的类型,转失败就返回nil, as！是强制转换,失败就奔溃

        print( "玩的属性值:\(newObj.playString!),还是孙子类哦 \(grandClass)")
    }
    // MARK: 简单的使用懒加载
    func easyUseLazyLoad(){
        
        print("第一个使用懒加载:\(arrAddValue)")
        print("第二个使用懒加载:\(arrAddValue)")
        print("第三个使用懒加载:\(arrAddValue)")
        print("第四个使用懒加载:\(arrAddName)")
        print("第五个使用懒加载:\(arrAddName)")
        print("第六个使用懒加载:\(arrAddName)")
        
    }
    // MARK: 简单的使用构造方法(重载)
    func easyUseOverRide(){
        
        
        let testOne=TestClass.init()   // 直接调用初始化的方法
        let testTwo=TestClass.init(name: "赵子龙", age: 86, hobby: "截江救阿斗")  // 调用自己重载的初始化的方法(构造方法)
        
        // 另外一种方法调用,建议使用第一种,可读性好
        let oneClass=TestClass();
        let twoClass=TestClass(name: "关羽", age: 78, hobby: "温酒斩华雄")
        
        print("第一个人:\(testOne.name) 年龄:\(testOne.age) 爱好:\(testOne.hobby)")
        print("第二个人:\(testTwo.name) 年龄:\(testTwo.age) 爱好:\(testTwo.hobby)")
        print("第三个人:\(oneClass.name) 年龄:\(oneClass.age) 爱好:\(oneClass.hobby)")
        print("第四个人:\(twoClass.name) 年龄:\(twoClass.age) 爱好:\(twoClass.hobby)")
        
    }
    // MARK: 简单的通过字符串加载控制器
    func easyUseStringLoadViewController(){
        
        loadViewControllerWithString(VCName: "IndexViewController",isLog: true)
        loadViewControllerWithString(VCName: "CircleViewController",isLog: false)
        loadViewControllerWithString(VCName: "MessageViewController",isLog: false)
        loadViewControllerWithString(VCName: "MyCenterViewController",isLog: false)
        
    }
    // 通过字符串加载控制器
    func loadViewControllerWithString(VCName:String,isLog:Bool){
        
        if isLog {
            print("本类的格式:\(self)")
        }
        
        let nameString = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""   // 1.0 动态获取命名空间
        let classNameString = nameString+"."+VCName                                     // 2.0 拼接类名字符串(命名空间.类名)
        
        let VCClass:AnyClass?=NSClassFromString(classNameString)                        // 3.0 将类名字符串转为类
        let className=VCClass as!UIViewController.Type                                  // 4.0 将类转为UIViewController类型
//        let className=VCClass as!ViewController.Type                                  // 注意:这里不能改成ViewController,不然就是获取的是本类的类型
        _=className.init()                                                              // 5.0 通过类名初始化控制器
        
//        let className = NSClassFromString(classNameString)as?UIViewController.Type      // 上面三句代码的连贯写法
//        _=className?.init()
        
        print("类名是:\(VCClass)")
    
    }
    
    // MARK: 简单的使用扩展
    func easyUseExtension(){
        
        let getName=Bundle.main.getSpaceName()      // 使用扩展的 函数
        print("得到的命名空间是:\(getName)")
        
        let paramValue:String!=Bundle.main.useAddAParam    //  使用扩展的 属性
        print("扩展的属性得到的值是:\(paramValue)")
    }
    // MARK: 简单的使用协议
    func easyUseProtocol(){
        
        let vcClass=ViewController()
        let backValue=vcClass.proMethod(stringParam: "IOS开发者")  // 调用协议中的函数
        print(backValue)
        vcClass.changeMethod(intValue: 22)
        
        
        let arr:[String]=["元素一","元素一","元素一","元素一"]   // 数字里面只能存 String类型 泛型字符串数组
        print("数组泛型里面的值:\(arr)")
        
    }
}

