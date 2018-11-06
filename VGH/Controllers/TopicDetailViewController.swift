//
//  TopicDetailViewController.swift
//  VGH
//
//  Created by 冯奕琦 on 2018/11/6.
//  Copyright © 2018年 冯奕琦. All rights reserved.
//

import UIKit

class TopicDetailViewController: UIViewController {

    @IBOutlet weak var replysTableView: UITableView!
    
    var dataSource:TopicsDetailData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加NavigationBar
        self.navigationController!.isNavigationBarHidden = false
        //添加tableView delegate
        replysTableView.dataSource = self
        replysTableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //添加NavigationBar
        self.navigationController!.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //删除NavigationBar
        self.navigationController!.isNavigationBarHidden = true
    }
}


extension TopicDetailViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let order = indexPath.row
//        let cell:UITableViewCell!
        if order == 0 {
            //标题cell
            let staticCell = tableView.dequeueReusableCell(withIdentifier: "staticCell") as! StaticTopicCell
            staticCell.set(data: (title: dataSource.title, UserName: dataSource.createrName, content: dataSource.content))
            return staticCell
        }else{
            //回复cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "replyCell") as! RepliesTableViewCell
            cell.set(data: dataSource.replys[order-1])
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(dataSource.replys.count)
        return dataSource.replys.count+1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //取消选择
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


