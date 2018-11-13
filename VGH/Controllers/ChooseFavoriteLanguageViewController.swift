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
    var currentFavoriteLanguagesArray:[String]!//初始化的时候进行o配置
    let dataSource = Constants.languageDictionary
    lazy var keysArray = { return [String](dataSource.keys).sorted() }()
    
    //MARK: IBOutlet
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var langeuageTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        langeuageTableView.dataSource = self
        langeuageTableView.delegate = self
        langeuageTableView.sectionFooterHeight = 0
        langeuageTableView.sectionHeaderHeight = 10
    }
    
    
}

extension ChooseFavoriteLanguageViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Favorite Languages"
        }else{
            //使用keys创造数组
//            print(keysArray)
            return keysArray[section-1]
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.keys.count+1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dataArray = section == 0 ? currentFavoriteLanguagesArray! : dataSource[keysArray[section-1]]!
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = indexPath.section == 0 ? "choosenCell":"languageCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)!
        let label = cell.textLabel!
        if indexPath.section != 0{
            //配置All language
            let wordArray = dataSource[keysArray[indexPath.section-1]]!
            label.text = wordArray[indexPath.row]
            print(label.text!)
            print(cell.accessoryType == .checkmark)
        }else{
            //配置Favorite Language
            label.text = currentFavoriteLanguagesArray[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        let choosenLanguage = cell.textLabel!.text!
        let checkMark = cell.accessoryType == .checkmark
        cell.accessoryType = checkMark ? .none :.checkmark
        
        print(choosenLanguage)
    }
    
    
}
