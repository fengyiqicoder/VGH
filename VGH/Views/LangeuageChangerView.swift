//
//  LangeuageChangerView.swift
//  VGH
//
//  Created by 冯奕琦 on 2018/11/10.
//  Copyright © 2018 冯奕琦. All rights reserved.
//

import UIKit

class LangeuageChangerView: UIView {
    
    static let width:CGFloat = 162
    static let heightForACell:CGFloat =  30
    
    var delegate:ChangeLangeuageButtonDelegate!
    
    convenience init(midPoint:CGPoint,favoriteLanguage:[String]){
        let x = midPoint.x - LangeuageChangerView.width/2
        let y = midPoint.y
        let height = LangeuageChangerView.heightForACell*CGFloat(favoriteLanguage.count+1)
        self.init(frame: CGRect(x: x, y: y, width: LangeuageChangerView.width, height: height))
        //添加Buttons和配置Views的颜色
        self.backgroundColor = #colorLiteral(red: 0.140522033, green: 0.160482645, blue: 0.1813155115, alpha: 1)
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        //新建button列表
        var lastViewMaxY:CGFloat!
        for (index,names) in favoriteLanguage.enumerated(){
            //创建新的button
            let y = LangeuageChangerView.heightForACell*CGFloat(index)
            let newButton = createAButton(frame: CGRect(x: 0, y: y, width: LangeuageChangerView.width, height: LangeuageChangerView.heightForACell)
                                                    ,names: names)
            
            //创建分割线
            let newLine = UIView(frame: CGRect(x: 0, y: newButton.frame.maxY-1, width: newButton.frame.width, height: 1))
            newLine.backgroundColor = UIColor.white
            //添加到view
            self.addSubview(newButton)
            self.addSubview(newLine)
            //储存LastView
            lastViewMaxY = newLine.frame.maxY
        }
        //创建最后一个 “添加语言“按钮
        let addLanguageButton = createAButton(frame: CGRect(x: 0, y: lastViewMaxY, width: LangeuageChangerView.width, height: LangeuageChangerView.heightForACell), names: Constants.addNewLanguageButtonTitle)
        self.addSubview(addLanguageButton)
    }
    
    func createAButton(frame:CGRect,names:String) -> UIButton {
        let newButton = UIButton(frame:frame)
        newButton.setTitle(names, for: .normal)
        newButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        newButton.titleLabel?.textAlignment = .center
        newButton.tintColor = UIColor.white
        //连接函数
        newButton.addTarget(self, action: #selector(buttonTap(sender:)), for: UIControl.Event.touchUpInside)
        return newButton
    }
    
    @objc func buttonTap(sender:UIButton){
        let buttonTitle = sender.title(for: .normal) ?? "Nil"
        self.isHidden = true
        if buttonTitle == Constants.addNewLanguageButtonTitle {
            delegate.segueToFavoriteLanguageVC()
        }else{
            //使用delegate方法
            delegate.changeModel(language: sender.title(for: .normal)!)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
   
    override func draw(_ rect: CGRect) {
        // Drawing code
    }

}

protocol ChangeLangeuageButtonDelegate {
    func changeModel(language:String)
    func segueToFavoriteLanguageVC()
}
