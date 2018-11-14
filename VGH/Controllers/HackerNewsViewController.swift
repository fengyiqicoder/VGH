//
//  HackerNewsViewController.swift
//  VGH
//
//  Created by 冯奕琦 on 2018/11/14.
//  Copyright © 2018 冯奕琦. All rights reserved.
//

import UIKit
import WebKit

class HackerNewsViewController: UIViewController {

    //MARK:Outlets
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //配置Webview
        webView.navigationDelegate = self;
        webView.allowsBackForwardNavigationGestures = true
        //创建网页加载的偏好设置
        let prefrences = WKPreferences()
        prefrences.javaScriptEnabled = true
        //配置网页视图
        webView.configuration.preferences = prefrences
        //配置url
        let url = URL(string: "https://news.ycombinator.com/news")!
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    @IBAction func goBack(){
        webView.goBack()
    }


}

// MARK: WKNavigationDelegate
extension HackerNewsViewController: WKNavigationDelegate {
    //视图开始载入的时候显示左上交网络活动指示器
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    //载入结束后，关闭网络活动指示器
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}
