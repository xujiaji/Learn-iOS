//
//  ViewController.swift
//  NSURLSesstionTest
//
//  Created by Longdoudou on 2018/7/23.
//  Copyright © 2018年 xujiaji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let urlString = "http://www.wanandroid.com/article/list/1/json"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 创建请求配置
        let config = URLSessionConfiguration.default
        // 创建请求URL
        let url = URL(string: "http://www.wanandroid.com/article/list/1/json")
        // 创建请求实例
        var request = URLRequest(url: url!)
        //进行请求头的设置
        request.setValue("apiKeyvalue", forHTTPHeaderField: "apiKey")
        
        // 设置请求为POST
        request.httpMethod = "POST"
        // 设置请求体参数
        request.httpBody = "需要传递的参数字符串".data(using: .utf8)
        
        //创建请求Sesstion
        let session = URLSession(configuration: config)
        //创建请求任务
        let task = session.dataTask(with: request) { (data, response, error) in
            print(String(data:data!, encoding: .utf8) ?? "no no no")
//            let dictionary = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
//            print(dictionary)
        }
        
        // 激活请求任务
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

