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
    static let NodeNamesArray:[(name:String,width:CGFloat)] = [("apple",50),("iPhone",70),("iPad",50),("macOS",70),("Android",80),("电影",50),("音乐",50),("旅游",50),("电子游戏",90)]
}
