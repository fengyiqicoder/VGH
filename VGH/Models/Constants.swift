//
//  Constants.swift
//  VGH
//
//  Created by 冯奕琦 on 2018/11/1.
//  Copyright © 2018年 冯奕琦. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    static let nodeDataUrl = "https://www.v2ex.com/api/topics/show.json?node_name="
    static let detailDataUrl = "https://www.v2ex.com/api/replies/show.json?topic_id="
    static let NodeNamesArray:[(name:String,apiName:String?,width:CGFloat)] = [("程序员","programmer",70),("奇思妙想","ideas",90),("问与答","qna",70),("分享创造","create",90),("apple",nil,50),("电影","Movie",50),("iPhone",nil,70),("电子游戏","games",90),("iPad",nil,50),("音乐","music",50),("macOS",nil,70),("iOS 开发","idev",110),("Android",nil,80),("旅游","travel",50),("重口味问与答","offworld",135),("Python","python",90),("Linux","linux",70),("阅读","reading",50),("设计","design",50),("旅行","travel",50),("mbp","mbp",40)]
}
