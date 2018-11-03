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
    static let NodeNamesArray:[(name:String,apiName:String?,width:CGFloat)] = [("apple",nil,50),("iPhone",nil,70),("iPad",nil,50),("macOS",nil,70),("Android",nil,80),("电影","Movie",50),("音乐","music",50),("旅游","travel",50),("电子游戏","games",90)]
}
