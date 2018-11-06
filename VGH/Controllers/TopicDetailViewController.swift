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
    @IBOutlet weak var replysTableView: UITableView!
    @IBOutlet weak var createrNameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    var dataSource:TopicsDetailData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加NavigationBar
        self.navigationController!.isNavigationBarHidden = false
        titleLabel.text = dataSource.title
        contentLabel.text = dataSource.content
        createrNameLabel.text = dataSource.createrName
        //添加tableView delegate
        replysTableView.dataSource = self
        replysTableView.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //删除NavigationBar
        self.navigationController!.isNavigationBarHidden = true
    }
}


extension TopicDetailViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "replyCell") as! RepliesTableViewCell
        cell.set(data: dataSource.replys[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(dataSource.replys.count)
        return dataSource.replys.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //取消选择
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


