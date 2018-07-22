//
//  ViewController.swift
//  LearnTableView
//
//  Created by Longdoudou on 2018/7/20.
//  Copyright © 2018年 xujiaji. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var dataArrary: [Product] = []
    //刷新控制器
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pro1 = Product()
        pro1.imageName = "img"
        pro1.name = "name1"
        pro1.subTitle = "何以解忧啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦"
        pro1.price = "999$"
        dataArrary.append(pro1)
        dataArrary.append(pro1)
        
        tableView = UITableView(frame: self.view.frame, style: .grouped)
        // 注册Cell
//        tableView.register(NSClassFromString("UITableViewCell"), forCellReuseIdentifier: "TableViewCellId")
        tableView.register(UINib.init(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCellId")
        self.view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        tableView.contentInset = UIEdgeInsets(top: -25, left: 0, bottom: 0, right: 0)
//        tableView.contentInset = UIEdgeInsetsMake(64, 0.0, 49, 0.0)
        // ableview会下降状态栏的高度
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        
        // 初始化刷新
        refreshControl.backgroundColor = UIColor.blue
        refreshControl.attributedTitle = NSAttributedString(string: "刷新一下：\(Data())", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        refreshControl.tintColor = UIColor.green // 加载菊花颜色
        refreshControl.tintAdjustmentMode = .dimmed // 色彩调整模式
        refreshControl.addTarget(self, action: #selector(addcount), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 100))
        view.backgroundColor = UIColor.red
        tableView.tableFooterView = view
    }
    
    @objc func addcount() {
        dataArrary.append(contentsOf: dataArrary)
        tableView.reloadData()
        refreshControl.endRefreshing()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArrary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId", for: indexPath)
//        cell.textLabel?.text = areas[indexPath.row]
//        return cell
        // 获取到载体Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId", for: indexPath) as! ProductTableViewCell
        let model = dataArrary[indexPath.row]
        cell.iconView.image = UIImage(named: model.imageName!)
        cell.proTitle.text = model.name
        cell.proDetail.text = model.subTitle
        cell.price.text = model.price
        return cell
    }
    
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
    // 设置分区数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

//    // 设置分区头部标题
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "我是分区头部"
//    }
//
//    // 设置分区尾部标题
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "我是分区尾部"
//    }

    // 将设置分区的头部视图
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 120))
        view.backgroundColor = UIColor.red
        return view
    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 50))
//        view.backgroundColor = UIColor.green
//        return view
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    // 设置每一行的行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 153
    }
}

