//
//  GithubModel.swift
//  VGH
//
//  Created by 冯奕琦 on 2018/11/10.
//  Copyright © 2018 冯奕琦. All rights reserved.
//

import Foundation

class GithubModel {
    
    var defaults = UserDefaults.standard
    
    //Trend的model进行语言控制
    
    var currentLangage:String = Constants.allLangages[0]
    
    func ChangeLangeuageTo(_ word:String){//使用Constants传入
        currentLangage = word
    }
    
    var favoriteLanguage:[String] = [Constants.allLangages[0]] {
        didSet{
            //持久化数据
            defaults.setValue(favoriteLanguage, forKey: "favoriteLanguage")
            print("持久化数据")
        }
    }
    
    init() {
        if let oldFavoriteLanguageValue = defaults.object(forKey: "favoriteLanguage") as? [String]{
            favoriteLanguage = oldFavoriteLanguageValue
            print("获取持久化数据")
        }
    }
    
}

