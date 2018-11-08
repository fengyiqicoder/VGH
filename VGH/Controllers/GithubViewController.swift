//
//  GithubViewController.swift
//  VGH
//
//  Created by 冯奕琦 on 2018/11/8.
//  Copyright © 2018 冯奕琦. All rights reserved.
//

import UIKit
import WebKit

class GithubViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
//    override func loadView() {
//        //创建网页加载的偏好设置
//        let prefrences = WKPreferences()
//        prefrences.javaScriptEnabled = false
//
//        //配置网页视图
//        let webConfiguration = WKWebViewConfiguration()
//        webConfiguration.preferences = prefrences
//
//        webView = WKWebView(frame: CGRect(x: 0, y: 20, width: 0, height: 0), configuration: webConfiguration)
//
//        view = webView
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self;
        let myURL = URL(string: "https://github.com/trending/swift?since=daily")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    


}


// MARK: WKNavigationDelegate
extension GithubViewController: WKNavigationDelegate {
    //视图开始载入的时候显示网络活动指示器
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    //载入结束后，关闭网络活动指示器
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    //阻止链接被点击
//    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//        if navigationAction.navigationType == .linkActivated {
//            decisionHandler(.cancel)
//
//            let alertController = UIAlertController(title: "Action not allowed", message: "Tapping on links is not allowed. Sorry!", preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            present(alertController, animated: true, completion: nil)
//            return
//
//        }
//
//        decisionHandler(.allow)
//    }
}
