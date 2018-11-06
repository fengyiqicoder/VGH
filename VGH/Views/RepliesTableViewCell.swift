//
//  RepliesTableViewCell.swift
//  VGH
//
//  Created by 冯奕琦 on 2018/11/6.
//  Copyright © 2018年 冯奕琦. All rights reserved.
//

import UIKit

class RepliesTableViewCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var content: UILabel!
    
    var replyData:ReplysData!
    
    func set(data:ReplysData){
        self.replyData = data
        //把data装入View
        userName.text = replyData.userNameString
        content.text = replyData.content
        //通过网络获取UIImage
        let imageUrl = replyData.userImageURL
    }
    
    

}
