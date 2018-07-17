//
//  ViewController.swift
//  BeautyGallery
//
//  Created by Longdoudou on 2018/7/16.
//  Copyright © 2018年 XuJiaji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var beautyPicker: UIPickerView!
    
    let beauties = ["范冰冰", "李冰冰", "王菲", "杨幂", "周迅"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        beautyPicker.delegate = self
        beautyPicker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToGallery" {
            let index = beautyPicker.selectedRow(inComponent: 0)
            var imageName: String?
            switch index {
            case 0:
                imageName = "fangbingbing"
            case 1:
                imageName = "libingbing"
            case 2:
                imageName = "wangfei"
            case 3:
                imageName = "yangmi"
            case 4:
                imageName = "zhouxu"
            default:
                imageName = nil
            }
            
            let vc = segue.destination as! GalleryViewController
            vc.imageName = imageName
        }
    }

    @IBAction func closedPrePage(segue: UIStoryboardSegue) {
        print("closed")
    }

}

