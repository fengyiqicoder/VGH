//
//  NodesBarView.swift
//  VGH
//
//  Created by 冯奕琦 on 2018/11/2.
//  Copyright © 2018年 冯奕琦. All rights reserved.
//

import UIKit

class NodesBarView: UIScrollView {
    
    var buttonArray:[UIButton] = []
    var delegateToUpdate:NodesBarProtocol!
    
    var currentNodeName:String!{
        didSet{
            //更新TableView
            delegateToUpdate.updateTableView(newNodeName: currentNodeName)
        }
    }
    //UISize
//    let buttonWeight:CGFloat = 50
    let buttonGap:CGFloat = 10
    let buttonHeight:CGFloat = 30
    
    //MARK: Functions
    
    override convenience init(frame: CGRect) {
        self.init(frame: frame)
        initBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initBar()
    }
    
    func initBar() {
        //载入Nodes
        for (index,nodes) in Constants.NodeNamesArray.enumerated(){
            //创建button
//            print(nodeName)
            let x = index == 0 ? buttonGap : buttonArray[index-1].frame.maxX+buttonGap
            let newButton = UIButton(frame: CGRect(x: x, y: 7, width: nodes.width, height: buttonHeight))
            newButton.setTitle(nodes.name, for: .normal)
            //disable存放apiName
            newButton.setTitle(nodes.apiName ?? nodes.name, for: .disabled)
            newButton.setTitleColor(#colorLiteral(red: 0.3333333333, green: 0.3333333333, blue: 0.3333333333, alpha: 1), for: .normal)
            newButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            newButton.layer.cornerRadius = 3
            //连接node
            newButton.addTarget(self, action: #selector(touchANode), for: UIControl.Event.touchDown)
            //添加到ScrollView中
            self.addSubview(newButton)
            //储存到array中
            buttonArray.append(newButton)
        }
        //设置范围
        self.contentSize = CGSize(width: buttonArray.last!.frame.maxX, height: self.bounds.height)
    }
    
    func initFirstNode(){
        //设置初始化的node
        buttonArray.first!.changeToBlack()
        currentNodeName = buttonArray.first!.title(for: .disabled)
    }
    
    func getCurrentNodeName() -> String {
        return currentNodeName
    }
    
    @objc func touchANode(sender:UIButton) {
        //更新View的展示 当前View
        if let actualTitle = sender.title(for: .disabled){
            if currentNodeName != actualTitle {
                currentNodeName = actualTitle
                //更新view
                setAllButtonWhite()
                sender.changeToBlack()
            }
        }
        
    }
    
    func setAllButtonWhite() {
        for buttons in buttonArray {
            buttons.changeToWhite()
        }
    }
}


protocol NodesBarProtocol {
    func updateTableView(newNodeName:String)
}

//MARK:更改Button颜色
extension UIButton {
    
    func changeToBlack() {
        self.setTitleColor(UIColor.white, for: .normal)
        self.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.1921568627, blue: 0.2666666667, alpha: 1)
    }
    
    func changeToWhite() {
        self.setTitleColor(#colorLiteral(red: 0.3333333333, green: 0.3333333333, blue: 0.3333333333, alpha: 1), for: .normal)
        self.backgroundColor = UIColor.white
    }
}
