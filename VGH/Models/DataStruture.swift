//
//  DataStruture.swift
//  VGH
//
//  Created by 冯奕琦 on 2018/11/1.
//  Copyright © 2018年 冯奕琦. All rights reserved.
//

import Foundation
//创建每个分类中的Topic数据类型

struct ClassifyTopicsData {
    var id:Int
    var title:String
    var createUserName:String
    var content:String
    var replyAmount:Int
}

struct NodesTopicsData {
    var name:String
    var topics:[ClassifyTopicsData] = []
}

struct ReplysData {
    var userNameString:String
    var userImageURL:String
    var content:String
}

struct TopicsDetailData {
    var id:String
    var title:String
    var content:String
    var replys:[ReplysData] = []
}

