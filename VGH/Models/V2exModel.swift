//
//  V2exModel.swift
//  VGH
//
//  Created by 冯奕琦 on 2018/11/1.
//  Copyright © 2018年 冯奕琦. All rights reserved.
//

import Foundation


class V2exModel {//V2ex的模型
    //被储存的主题
    var savedNodes:[String:NodesTopicsData] = [:]
    //储存的主题的回复
    var savedTopicsDetails:[String:TopicsDetailData] = [:]
    //UIProtocol
    var updateViewProtocol:ChangeNetworkUserInterfaceProtocol!
    
    //与Controller交互的方法
    
    func getDataFor(nodes:Bool,name:String,update:Bool) -> Any? {//返回Topic或者是Details
        let dataDictionary:[String:Any] = nodes ? savedNodes : savedTopicsDetails //确认要的是哪个数据
        if let actualData = dataDictionary[name] , update == false{
            return actualData
        }else{
            //从网络获取
            getNetworkNodeData(name: name)
            return nil
        }
    }
    
    
    //获取Node数据 更新或者储存data到字典里
    func getNetworkNodeData(name:String){
        let urlString = Constants.nodeDataUrl + name
        let url = URL(string: urlString)!
        URLSession.shared.dataTask(with: url){ (data,responds,error) in
            if error == nil , let actuclData = data {
                //进行结果解析
                do{
                    let rawJson = try JSONSerialization.jsonObject(with: actuclData, options: [])
                    if let jsonDictionnaryArray = rawJson as? [[String:Any]]{
                        //Node下的topics
                        var newNodeData = NodesTopicsData(name:name, topics: [])
                        for topics in jsonDictionnaryArray{
                            //获取数据
                            let title = topics["title"]! as! String
                            let id = topics["id"]! as! Int
                            let replies = topics["replies"]! as! Int
                            let userInfo = topics["member"] as! [String:Any]
                            let userName = userInfo["username"]! as! String
                            //创建数据
                            let topic = ClassifyTopicsData(id:id,title:title,createUserName:userName,replyAmount:replies)
                            //储存到node下
                            newNodeData.topics.append(topic)
                        }
                        //储存到字典中
                        self.savedNodes[name] = newNodeData
//                        print(newNodeData)
                        //更新界面 使用代理
                        self.updateViewProtocol.changeInterfaceBaseOn(data: newNodeData)
//                        print("新数据到达！")
                    }else{
                        print("类型不正确")
                        return
                    }
                }catch let parsingError {
                    print("Error", parsingError)
                }
            }else{
                print(error!)
            }
        }.resume()
    }
    
}

protocol ChangeNetworkUserInterfaceProtocol {
    func changeInterfaceBaseOn(data:NodesTopicsData)
}
