//
//  AllMacro.swift
//  Test_Swift
//
//  Created by 冷求慧 on 2017/9/3.
//  Copyright © 2017年 Leng. All rights reserved.
//

import Foundation

// MARK: 自定义输出日志(1)
// filePath:文件路径  rowCount:行号
func LogMsgWithDebug(filePath: String = #file, rowCount: Int = #line) {  // LogMsgWithDebug 函数名
    #if DEBUG
        let fileName = (filePath as NSString).lastPathComponent.replacingOccurrences(of: ".swift", with: "")
        print(fileName + "类中第" + "\(rowCount)" + "行: ")
        
    #endif
}
// MARK: 自定义输出日志(2)
// 在上面的基础上新增 信息
func LogMsgWithDebug<Msg>(filePath: String = #file, rowCount: Int = #line, _ message: Msg) {
    #if DEBUG
        let fileName = (filePath as NSString).lastPathComponent.replacingOccurrences(of: ".swift", with: "")
        print(fileName + "类中第" + "\(rowCount)" + "行,打印信息是:" + " \(message)")
    #endif
}
