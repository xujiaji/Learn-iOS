//
//  TodoModel.swift
//  Todo
//
//  Created by Longdoudou on 2018/7/17.
//  Copyright © 2018年 XuJiaji. All rights reserved.
//

import UIKit

class TodoModel: NSObject {
    var id: String
    var image: String
    var title: String
    var date: Date
    
    init(id: String, image: String, title: String, date: Date) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }
}
