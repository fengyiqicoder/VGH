//
//  NetworkManager.swift
//  VGH
//
//  Created by 冯奕琦 on 2018/11/1.
//  Copyright © 2018年 冯奕琦. All rights reserved.
//

import Foundation
import UIKit

class NetWorkManager {
    //获取数据图片
    
    static func getImageFrom(url:String,handler:@escaping (UIImage)->Void){
        let url = URL(string: url)!
        URLSession.shared.dataTask(with: url){ (data,reponds,error) in
            if let actualData = data,error == nil{
                let image = UIImage(data: actualData)!
                DispatchQueue.main.async {
                    handler(image)
                }
            }
        }.resume()
    }
    
}
