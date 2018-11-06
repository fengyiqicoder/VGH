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
    
    func getDataFor(nodes:Bool,nodeName:String,update:Bool,id:String?) -> Any? {//返回Topic或者是Details
        let dataDictionary:[String:Any] = nodes ? savedNodes : savedTopicsDetails //确认要的是哪个数据
        let key = nodes ? nodeName : id!
        if let actualData = dataDictionary[key] , update == false{
            return actualData
        }else{
            //从网络获取
            getNetworkNodeData(forNode: nodes, nodeName: nodeName, id: id)
            return nil
        }
    }
    
    
    //获取Node数据 更新或者储存data到字典里
    func getNetworkNodeData(forNode:Bool,nodeName:String,id:String?){
        print("请求网络")
        // 生成不同的Url
        let basicUrl = forNode == true ? Constants.nodeDataUrl : Constants.detailDataUrl
        let urlString = basicUrl + (forNode ? nodeName : id!)
        let url = URL(string: urlString)!
        URLSession.shared.dataTask(with: url){ (data,responds,error) in
            if error == nil , let actuclData = data {
                //进行结果解析
                do{
                    let rawJson = try JSONSerialization.jsonObject(with: actuclData, options: [])
                    if let jsonDictionnaryArray = rawJson as? [[String:Any]]{
                        //不同的数据解析
                        if forNode == true {
                            //解析Node
                            var newNodeData = NodesTopicsData(name:nodeName, topics: [])
                            for topics in jsonDictionnaryArray{
                                //获取数据
                                let title = topics["title"]! as! String
                                let id = topics["id"]! as! Int
                                let replies = topics["replies"]! as! Int
                                let userInfo = topics["member"] as! [String:Any]
                                let userName = userInfo["username"]! as! String
                                let content = topics["content"] as! String
                                //创建数据
                                let topic = ClassifyTopicsData(id:id,title:title,createUserName:userName,content:content,replyAmount:replies)
                                //储存到node下
                                newNodeData.topics.append(topic)
                            }
                            //储存到字典中
                            self.savedNodes[nodeName] = newNodeData
                            //使用代理更新界面
                            self.updateViewProtocol.changeNodesInterfaceBaseOn(data: newNodeData)
                            
                        }else{
                            
                            //解析Replys
                            //寻找title and content
                            let topicData = self.savedNodes[nodeName]!
                            let id = id!
                            var newDetailData:TopicsDetailData!
                            for topic in topicData.topics{
                                if id == String(topic.id){
                                    newDetailData = TopicsDetailData(id:id,title:topic.title,content:topic.content,replys:[])
                                    break
                                }
                            }
                            for replys in jsonDictionnaryArray{
                                //获取数据
                                let content = replys["content"] as! String
                                let memberDic = replys["member"] as! [String:Any]
                                let userName = memberDic["username"] as! String
                                let userImageURL = "http:" + (memberDic["avatar_normal"] as! String)
                                //创建数据
                                let reply = ReplysData(userNameString:userName,userImageURL:userImageURL,content:content)
                                //储存到topic下
                                newDetailData.replys.append(reply)
                            }
                            //储存到字典中
                            self.savedTopicsDetails[id] = newDetailData
                            //使用代理更新界面
                            self.updateViewProtocol.segueToTopicDetailInterfaceBaseOn(data: newDetailData)
                            
                        }
                        
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
    func changeNodesInterfaceBaseOn(data:NodesTopicsData)
    func segueToTopicDetailInterfaceBaseOn(data:TopicsDetailData)
}
