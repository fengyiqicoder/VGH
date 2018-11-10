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
    
    convenience init(midPoint:CGPoint,favoriteLanguage:[String]){
        let x = midPoint.x - LangeuageChangerView.width/2
        let y = midPoint.y
        let height = LangeuageChangerView.heightForACell*CGFloat(favoriteLanguage.count+1)
        self.init(frame: CGRect(x: x, y: y, width: LangeuageChangerView.width, height: height))
        //添加Buttons和配置Views的颜色
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

protocol changeLangeuageButtonDelegate {
    func changeModel(language:String)
    func segueToFavoriteLanguageVC()
}
