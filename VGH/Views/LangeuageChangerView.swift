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
    var languageButtonArray:[UIButton] = []
    var currentLanguageName:String = Constants.allLangages[0]
    var favoriteLanguage:[String]!
    
    
    convenience init(midPoint:CGPoint,favoriteLanguage:[String]){
        let x = midPoint.x - LangeuageChangerView.width/2
        let y = midPoint.y
        let height = LangeuageChangerView.heightForACell*CGFloat(favoriteLanguage.count)
        self.init(frame: CGRect(x: x, y: y, width: LangeuageChangerView.width, height: height))
        self.favoriteLanguage = favoriteLanguage
        //和配置Views的颜色
        self.backgroundColor = #colorLiteral(red: 0.140522033, green: 0.160482645, blue: 0.1813155115, alpha: 1)
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        updateButtonList(favoriteLanguage: favoriteLanguage)
    }
    
    func updateButtonList(favoriteLanguage:[String]) {
        //清空列表
        for button in languageButtonArray {
            button.removeFromSuperview()
        }
        languageButtonArray.removeAll()
        //update frame
//        let height = LangeuageChangerView.heightForACell*CGFloat(favoriteLanguage.count)
//        self.frame = CGRect(x: frame.minX, y: frame.minY,
//                            width: LangeuageChangerView.width, height: height)
        //新建button列表 updateButtonList
        for names in favoriteLanguage{
            if names == currentLanguageName{ continue }
            print(names)
            //创建新的button
            let y = LangeuageChangerView.heightForACell*CGFloat(languageButtonArray.count)
            let newButton = createAButton(frame: CGRect(x: 0, y: y, width: LangeuageChangerView.width, height:          LangeuageChangerView.heightForACell)
                ,names: names)
            languageButtonArray.append(newButton)
            //创建分割线
            let newLine = UIView(frame: CGRect(x: 0, y: newButton.frame.maxY-1, width: newButton.frame.width, height: 1))
            newLine.backgroundColor = UIColor.white
            //添加到view
            self.addSubview(newButton)
            self.addSubview(newLine)
        }
        //创建最后一个 “添加语言“按钮
        let lastViewMaxY:CGFloat = languageButtonArray.last?.frame.maxY ?? 0
        let addLanguageButton = createAButton(frame: CGRect(x: 0, y: lastViewMaxY, width: LangeuageChangerView.width, height: LangeuageChangerView.heightForACell), names: Constants.addNewLanguageButtonTitle)
        self.addSubview(addLanguageButton)
        languageButtonArray.append(addLanguageButton)
        print(languageButtonArray)
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
            //重写编写ButtonList
            currentLanguageName = buttonTitle
            updateButtonList(favoriteLanguage: self.favoriteLanguage)
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
        print("Drawing")
    }

}

protocol ChangeLangeuageButtonDelegate {
    func changeModel(language:String)
    func segueToFavoriteLanguageVC()
}
