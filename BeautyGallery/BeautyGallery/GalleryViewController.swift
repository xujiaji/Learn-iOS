//
//  GalleryViewController.swift
//  BeautyGallery
//
//  Created by Longdoudou on 2018/7/16.
//  Copyright © 2018年 XuJiaji. All rights reserved.
//

import UIKit
import Social

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var beautyImage: UIImageView!
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let imageName = imageName {
            beautyImage.image = UIImage(named: imageName)
            switch imageName {
            case "fanbingbing":
                navigationItem.title = "范冰冰"
            case "libingbing":
                navigationItem.title = "李冰冰"
            case "wangfei":
                navigationItem.title = "王菲"
            case "yangmi":
                navigationItem.title = "杨幂"
            case "zhouxun":
                navigationItem.title = "周迅"
            default:
                navigationItem.title = "女神画廊"
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func shareTapped(_ sender: Any) {
        let controller = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        controller?.setInitialText("一起来玩女神画廊app吧，就在Github上")
        controller?.add(beautyImage.image)
    }
    
    
}

