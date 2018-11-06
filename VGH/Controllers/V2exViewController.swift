//
//  V2exViewController.swift
//  VGH
//
//  Created by 冯奕琦 on 2018/11/1.
//  Copyright © 2018年 冯奕琦. All rights reserved.
//

import UIKit

class V2exViewController: UIViewController {
    
    
    //MARK: Vars
    
    lazy var model = { () -> V2exModel in
        let newModel = V2exModel()
        newModel.updateViewProtocol = self
        return newModel
    }()//lazy创建添加protocal
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var nodeBar: NodesBarView!
    @IBOutlet weak var tableView: ToplicsTableView!
    
    //MARK:下拉刷新
    let refreshControl = UIRefreshControl()
    var currentNodeName:String{
        return nodeBar.getCurrentNodeName()
    }
    
    @objc func networkingRefresh() {
        let _ = model.getDataFor(nodes: true, nodeName: currentNodeName, update: true, id: nil)//确认更新数据
    }
    
    //MARK:VC LIFECycle
    override func viewDidLoad() {
        super.viewDidLoad()
        nodeBar.delegateToUpdate = self
        nodeBar.initFirstNode()
        //TableViewDelegate
        tableView.delegate = self
        tableView.dataSource = self
        //下拉刷新
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing Data")
        refreshControl.addTarget(self, action: #selector(networkingRefresh), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)
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
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        self.navigationController!.isNavigationBarHidden = true
//    }
    
    //MARK: C -> V 方法
    //TableView dataSource Value
    var dataSource:[ClassifyTopicsData] = []
    func updateTableViewWith(data:NodesTopicsData){//使用这个方法输入数据
        self.dataSource = data.topics
        DispatchQueue.main.async {
            self.refreshControl.endRefreshing()
            self.tableView.reloadData()
        }
    }
    
    //Segue 有关方法
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        super.unwind(for: unwindSegue, towards: subsequentVC)
        print("Back to Main ViewControler")
    }
    
    var topicDetailDataForSegue:TopicsDetailData?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier ,id == "segueToTopicDetail"{
            if let nextVC = segue.destination as? TopicDetailViewController{
                
                //添加数据
                if let actualDataForSegue = topicDetailDataForSegue{
                    nextVC.dataSource = actualDataForSegue
                }
            }
        }
    }
    
    func segueToDetail(data:TopicsDetailData) {
        topicDetailDataForSegue = data
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "segueToTopicDetail", sender: nil)
        }
    }
    
}
//MARK:ChangeNetworkUserInterfaceProtocol
extension V2exViewController:ChangeNetworkUserInterfaceProtocol{
    func changeNodesInterfaceBaseOn(data: NodesTopicsData) {
        //网络刷新方法
        updateTableViewWith(data: data)
    }
    
    func segueToTopicDetailInterfaceBaseOn(data: TopicsDetailData) {
        //网络刷新Topic
        segueToDetail(data: data)
    }
    
    
}
//MARK:NodesBarProtocol
extension V2exViewController:NodesBarProtocol{
    func updateTableView(newNodeName: String) {
       //向Model请求数据
        let oldData = model.getDataFor(nodes: true, nodeName: newNodeName, update: false, id: nil) as! NodesTopicsData?
        if let actualData = oldData {
            updateTableViewWith(data: actualData)
        }else{
//            print("请求网络")
        }
    }
}

//MARK:TableViewDelegate
extension V2exViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //行数
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell") as! TopicCell
        //装入数据
        let topicData = dataSource[indexPath.row]
        cell.setCellWith(data: topicData)
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
        let cell = tableView.cellForRow(at: indexPath) as! TopicCell
        let topicId = cell.getIdOfThisTopic()
        //新建VC
        let oldTopicReplyData = model.getDataFor(nodes: false, nodeName: currentNodeName, update: false, id: topicId) as? TopicsDetailData
        if let actualDetail = oldTopicReplyData {
            //使用Segue链接读入下个界面
            segueToDetail(data: actualDetail)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

