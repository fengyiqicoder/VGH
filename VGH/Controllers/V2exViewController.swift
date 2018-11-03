//
//  V2exViewController.swift
//  VGH
//
//  Created by 冯奕琦 on 2018/11/1.
//  Copyright © 2018年 冯奕琦. All rights reserved.
//

import UIKit

class V2exViewController: UIViewController {

    lazy var model = { () -> V2exModel in
        let newModel = V2exModel()
        newModel.updateViewProtocol = self
        return newModel
    }()//lazy创建添加protocal
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var nodeBar: NodesBarView!
    @IBOutlet weak var tableView: ToplicsTableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nodeBar.delegateToUpdate = self
        nodeBar.initFirstNode()
        //TableViewDelegate
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //绘制mainView的圆角跟阴影
        mainView.layer.masksToBounds = false
        mainView.layer.cornerRadius = 3//圆角
        mainView.layer.shadowOffset = CGSize(width: 0, height: 2)
        mainView.layer.shadowRadius = 2
        mainView.layer.shadowOpacity = 0.1
        mainView.layer.shadowColor = UIColor.black.cgColor
    }
    
    

}

extension V2exViewController:ChangeNetworkUserInterfaceProtocol{
    func changeInterfaceBaseOn(data: V2exModel) {
        //刷新方法
        print(data.savedNodes)
    }
}

extension V2exViewController:NodesBarProtocol{
    func updateTableView(newNodeName: String) {
        print(newNodeName)
    }
}

extension V2exViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //行数
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell") as! TopicCell
        //装入数据
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //选择这个Row
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

