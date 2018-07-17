//
//  Common.swift
//  Todo
//
//  Created by Longdoudou on 2018/7/17.
//  Copyright © 2018年 XuJiaji. All rights reserved.
//

import Foundation

func dateFromString (_ dateStr: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.date(from: dateStr)
}
