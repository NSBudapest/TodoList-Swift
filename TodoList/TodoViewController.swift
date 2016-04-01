//
//  TodoViewController.swift
//  TodoList
//
//  Created by Vásárhelyi Ágnes on 01/04/16.
//  Copyright © 2016 NSBudapest. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController {
    
    @IBOutlet weak var todoLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    var todoItem: String = ""
    var alert = UIAlertController()
    var delegate: TodoItemDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoLabel.text = todoItem
        todoLabel.accessibilityLabel = "Description: \(todoItem)"
        doneButton.accessibilityLabel = "Done"
    }
    
    @IBAction func doneButtonPressed() {
        self.presentViewController(alert, animated: true) { }
    }
}
