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
    var currentFavoriteLanguagesArray:[String]!//初始化的时候进行配置
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
        langeuageTableView.sectionIndexColor = #colorLiteral(red: 0.140522033, green: 0.160482645, blue: 0.1813155115, alpha: 1)
//        langeuageTableView.sectionIndexBackgroundColor = UIColor.white
    }
    //favoriteLanguage 辅助方法
    lazy var inFavofiteLanguage = { (name:String)->Bool in
        for language in self.currentFavoriteLanguagesArray{
            if language == name{
                return true
            }
        }
        return false
    }
    
    lazy var indexOfLanguage = {(name:String)->Int in
        for (index,language) in self.currentFavoriteLanguagesArray.enumerated(){
            if language == name{
                return index
            }
        }
        return -1
    }
    //Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let button = sender as? UIButton ,let text = button.title(for: .normal){
            print(text)
            if text == "取消"{
                self.currentFavoriteLanguagesArray = nil
            }
        }
    }
    
    
}

extension ChooseFavoriteLanguageViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Choosen Languages"
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
        cell.accessoryType = .none //确定没有Mark
        let label = cell.textLabel!
        if indexPath.section != 0{
            //配置All language
            let wordArray = dataSource[keysArray[indexPath.section-1]]!
            let name = wordArray[indexPath.row]
            cell.textLabel?.text = name
            //查看是否在favori中
//            print(name," ",cell.accessoryType == .checkmark," inFavofiteLanguage(name)",inFavofiteLanguage(name))
            if inFavofiteLanguage(name) {
                cell.accessoryType = .checkmark
            }
        }else{
            //配置Favorite Language
            label.text = currentFavoriteLanguagesArray[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            return
        }
        let cell = tableView.cellForRow(at: indexPath)!
        let choosenLanguage = cell.textLabel!.text!
        let checkMark = cell.accessoryType == .checkmark
        //添加或者删除到favorite
        if checkMark {//删除它
            currentFavoriteLanguagesArray.remove(at: indexOfLanguage(choosenLanguage))
        }else{
            currentFavoriteLanguagesArray.append(choosenLanguage)
        }
//        print(currentFavoriteLanguagesArray)
        //更新tableView
        tableView.reloadSections(IndexSet(integer: 0), with: UITableView.RowAnimation.fade)
        //更改View
        cell.accessoryType = checkMark ? .none :.checkmark
    }
    
    //MARK:索引
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return keysArray
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index+1
    }
}
