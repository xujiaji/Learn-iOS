//
//  RotationViewController.swift
//  AnimationSample
//
//  Created by Longdoudou on 2018/7/18.
//  Copyright © 2018年 XuJiaji. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {
    @IBOutlet weak var wheel: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func spin() {
        UIView.animate(withDuration: 1, delay: 0, options: [.curveLinear], animations: {
            self.wheel.transform = self.wheel.transform.rotated(by: CGFloat(Double.pi))
        }, completion: { (finished) -> Void in
            self.spin()
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        spin()
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
