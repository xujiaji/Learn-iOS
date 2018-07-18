//
//  ScaleViewController.swift
//  AnimationSample
//
//  Created by Longdoudou on 2018/7/18.
//  Copyright © 2018年 XuJiaji. All rights reserved.
//

import UIKit

class ScaleViewController: UIViewController {
    @IBOutlet weak var bludSquare: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1) {
            self.bludSquare.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
