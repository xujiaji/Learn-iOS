//
//  ViewController.swift
//  LearnUserDefaults
//
//  Created by Longdoudou on 2018/7/23.
//  Copyright © 2018年 xujiaji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
        // 获取程序默认的userDefaults实例
        let userDefaults = UserDefaults.standard
        // 进行url数据的存储
        userDefaults.set(URL(string: "http://www.baidu.com"), forKey: "urlKey")
        // 字符串数据的存储
        userDefaults.set("stringValue", forKey: "stringKey")
        // 字典数据类型的存储
        userDefaults.set(["1":"--"], forKey: "dictKey")
        // 进行Data数据的存储
        userDefaults.set(Data(), forKey: "dataKey")
        //立即将操作同步
        userDefaults.synchronize()
        
        
        // 获取url数据
        print(userDefaults.url(forKey: "urlKey"))
        // 获取字符串数据
        print(userDefaults.string(forKey: "stringKey"))
        
        // 清除一个已存储的数据
        userDefaults.removeObject(forKey: "stringKey")
        print(userDefaults.string(forKey: "stringKey"))
        
        
        // 学习Plist的数据存储
        // 获取文件路径
        let path = Bundle.main.path(forResource: "LearnPlist", ofType: "plist")
        // 将文件内容读成字典
        let dict = NSDictionary(contentsOfFile: path!)
        // 数据输出
        print(dict ?? "dict 为 nil") // 为空时， 打印信息需要添加默认值
        
        
        // 运行时创建Plist文件，并将其保存在应用程序的沙盒目录中，这种方式创建的Plist文件，可以方便的进行增删改查操作
        // 获取沙盒的用户数据目录
        let domainsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        // 拼接上文件名
        let fileName = domainsPath! + "/MyPlist.plist"
        let dict2: NSDictionary = ["name": "jaki", "age": "22"]
        //进行写文件
        dict2.write(toFile: fileName, atomically: true)
        //将存储的Plist文件进行读取
        let dicRes = NSDictionary(contentsOfFile: fileName)
        print(dicRes ?? "dic Res 为nil")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

