//
//  DetailViewController.swift
//  Todo
//
//  Created by Longdoudou on 2018/7/17.
//  Copyright © 2018年 XuJiaji. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var childBtn: UIButton!
    @IBOutlet weak var phoneBtn: UIButton!
    @IBOutlet weak var shopBtn: UIButton!
    @IBOutlet weak var planBtn: UIButton!
    @IBOutlet weak var textView: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var todo: TodoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textView.delegate = self
        if let todo = todo {
            navigationItem.title = "修改Todo"
            switch todo.image {
            case "child-selected": childBtn.isSelected = true
            case "phone-selected": phoneBtn.isSelected = true
            case "shopping-cart-selected": shopBtn.isSelected = true
            case "travel-selected": planBtn.isSelected = true
            default:
                childBtn.isSelected = true
            }
            textView.text = todo.title
            datePicker.setDate(todo.date, animated: false)
        } else {
            navigationItem.title = "新增Todo"
            childBtn.isSelected = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func changeNoSelected() {
        childBtn.isSelected = false
        phoneBtn.isSelected = false
        shopBtn.isSelected = false
        planBtn.isSelected = false
    }
    
    @IBAction func childTapped(_ sender: Any) {
        changeNoSelected()
        childBtn.isSelected = true
    }
    
    @IBAction func phoneTapped(_ sender: Any) {
        changeNoSelected()
        phoneBtn.isSelected = true
    }
    
    @IBAction func shopTapped(_ sender: Any) {
        changeNoSelected()
        shopBtn.isSelected = true
    }
    
    @IBAction func plainTapped(_ sender: Any) {
        changeNoSelected()
        planBtn.isSelected = true
    }
    
    @IBAction func okTapped(_ sender: Any) {
        let image: String
        if childBtn.isSelected {
            image = "child-selected"
        } else if phoneBtn.isSelected {
            image = "phone-selected"
        } else if shopBtn.isSelected {
            image = "shopping-cart-selected"
        } else {
            image = "travel-selected"
        }
        if todo == nil {
            todos.append(TodoModel(id: UUID().uuidString, image: image, title: textView.text!, date: datePicker.date))
        } else {
            todo?.image = image
            todo?.title = textView.text!
            todo?.date = datePicker.date
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textView.resignFirstResponder()
        return true
    }
}
