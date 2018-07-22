//
//  ProductTableViewCell.swift
//  LearnTableView
//
//  Created by Longdoudou on 2018/7/22.
//  Copyright © 2018年 xujiaji. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var proTitle: UILabel!
    @IBOutlet weak var proDetail: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
