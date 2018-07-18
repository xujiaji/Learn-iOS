//
//  RepeatViewController.swift
//  AnimationSample
//
//  Created by Longdoudou on 2018/7/18.
//  Copyright © 2018年 XuJiaji. All rights reserved.
//

import UIKit

class RepeatViewController: UIViewController {
    @IBOutlet weak var blueSquare: UIView!
    @IBOutlet weak var redSquare: UIView!
    @IBOutlet weak var greedSquare: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1) {
            self.blueSquare.center.x = self.view.bounds.width - self.blueSquare.center.x
        }
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat], animations: {
            self.redSquare.center.x = self.view.bounds.width - self.redSquare.center.x
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.greedSquare.center.x = self.view.bounds.width - self.greedSquare.center.x
        }, completion: nil)
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
