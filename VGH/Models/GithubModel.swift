//
//  GithubModel.swift
//  VGH
//
//  Created by 冯奕琦 on 2018/11/10.
//  Copyright © 2018 冯奕琦. All rights reserved.
//

import Foundation

class GithubModel {
    
    //Trend的model进行语言控制
    
    var currentLangage:String = Constants.allLangages[45]
    
    func ChangeLangeuageTo(_ word:String){//使用Constants传入
        currentLangage = word
    }
    
    var favoriteLanguage:[String] = [Constants.allLangages[0]]
    
    
    var noFacoriteLanguage:[String] {
        return Constants.allLangages.filter{(language)->Bool in
            for flanguage in favoriteLanguage{
                if flanguage == language{
                    return false
                }
            }
            return true
        }
    }
    
    
    
}

