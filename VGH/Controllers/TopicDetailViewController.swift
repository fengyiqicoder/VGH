//
//  TopicDetailViewController.swift
//  VGH
//
//  Created by 冯奕琦 on 2018/11/6.
//  Copyright © 2018年 冯奕琦. All rights reserved.
//

import UIKit

class TopicDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    var dataSource:TopicsDetailData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加NavigationBar
        self.navigationController!.isNavigationBarHidden = false
        titleLabel.text = dataSource.title
        // Do any additional setup after loading the view.
    }
    
}
