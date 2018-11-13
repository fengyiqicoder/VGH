//
//  ChooseFavoriteLanguageViewController.swift
//  VGH
//
//  Created by 冯奕琦 on 2018/11/12.
//  Copyright © 2018 冯奕琦. All rights reserved.
//

import UIKit

class ChooseFavoriteLanguageViewController: UIViewController {
    
    //MARK: dataSource
    var currentFavoriteLanguagesArray:[String]!
    let dataSource = Constants.languageDictionary
    lazy var keysArray = { return [String](dataSource.keys) }()
    
    //MARK: IBOutlet
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var langeuageTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        langeuageTableView.dataSource = self
        langeuageTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
}

extension ChooseFavoriteLanguageViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Favorite Languages"
        }else{
            //使用keys创造数组
            return keysArray[section-1]
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.keys.count+1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
