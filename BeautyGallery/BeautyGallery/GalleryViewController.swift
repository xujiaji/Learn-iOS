//
//  GalleryViewController.swift
//  BeautyGallery
//
//  Created by Longdoudou on 2018/7/16.
//  Copyright © 2018年 XuJiaji. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var beautyImage: UIImageView!
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let imageName = imageName {
            beautyImage.image = UIImage(named: imageName)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

