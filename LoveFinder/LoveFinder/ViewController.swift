//
//  ViewController.swift
//  LoveFinder
//
//  Created by Longdoudou on 2018/7/16.
//  Copyright © 2018年 XuJiaji. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var birthday: UIDatePicker!
    @IBOutlet weak var heightNumber: UISlider!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var hasProperty: UISwitch!
    @IBOutlet weak var result: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        name.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func heighedChanged(_ sender: Any) {
        let slider = sender as! UISlider
        height.text = "\(Int(slider.value))cm"
    }
    
    @IBAction func okTapped(_ sender: Any) {
        let genderText = gender.selectedSegmentIndex == 0 ? "高富帅" : "白富美"
        let hasPropertyText = hasProperty.isOn ? "有房": "没房"
        
        result.text = "\(String(describing: name.text!)), \(calAge(by: birthday)!)岁，\(genderText)，身高\(height.text!), \(hasPropertyText), 求交往！"
    }
    
    func calAge(by datePicker: UIDatePicker) -> Int? {
        let gregorian = NSCalendar(calendarIdentifier: .gregorian)
        let now = Date()
        let components = gregorian?.components(NSCalendar.Unit.year, from: datePicker.date, to: now, options: NSCalendar.Options.init(rawValue: 0))
        return components?.year
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        name.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

