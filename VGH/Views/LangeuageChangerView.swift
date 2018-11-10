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
        //新建button列表
        for (index,names) in favoriteLanguage.enumerated(){
            let y = LangeuageChangerView.heightForACell*CGFloat(index)
            let newButton = UIButton(frame: CGRect(x: 0, y: y,
                                                   width: LangeuageChangerView.width, height: LangeuageChangerView.heightForACell))
            
            newButton.setTitle(names, for: .normal)
            newButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
            newButton.titleLabel?.textAlignment = .center
            newButton.tintColor = UIColor.white
            //连接函数
            newButton.addTarget(self, action: #selector(buttonTap(sender:)), for: UIControl.Event.touchUpInside)
            //创建分割线
            let newLine = UIView(frame: CGRect(x: 0, y: newButton.frame.maxY-1, width: newButton.frame.width, height: 1))
            newLine.backgroundColor = UIColor.white
            //添加到view
            self.addSubview(newButton)
            self.addSubview(newLine)
        }
        //创建最后一个 “添加语言“按钮
    }
    
    @objc func buttonTap(sender:UIButton){
        print(sender.title(for: .normal) ?? "Nil")
        self.isHidden = true
        //使用delegate方法 没有Segue
        delegate.changeModel(language: sender.title(for: .normal)!)
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
