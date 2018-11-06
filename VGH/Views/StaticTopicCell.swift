//
//  StaticTopicCell.swift
//  VGH
//
//  Created by 冯奕琦 on 2018/11/6.
//  Copyright © 2018年 冯奕琦. All rights reserved.
//

import UIKit

class StaticTopicCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var createrUserName: UILabel!
    @IBOutlet weak var content: UILabel!
    
    func set(data:(title:String,UserName:String,content:String)) {
        titleLabel.text = data.title
        createrUserName.text = data.UserName
        content.text = data.content
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
