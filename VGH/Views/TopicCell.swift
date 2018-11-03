//
//  TopicCell.swift
//  VGH
//
//  Created by 冯奕琦 on 2018/11/3.
//  Copyright © 2018年 冯奕琦. All rights reserved.
//

import UIKit

class TopicCell: UITableViewCell {
    
    @IBOutlet weak var topicTitle: UILabel!
    @IBOutlet weak var repliesNumbers: PaddingLabel!
    @IBOutlet weak var createrName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellWith(data:ClassifyTopicsData) {
        topicTitle.text = data.title
        repliesNumbers.text = String(data.replyAmount)
        createrName.text = data.createUserName
    }

}
