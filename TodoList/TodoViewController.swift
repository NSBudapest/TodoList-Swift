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
        
        alert = UIAlertController(title: "Are you sure..", message:"..you are done with \(todoItem)?", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default) { _ in
            self.delegate?.deleteTodoItem(self.todoItem)
            self.navigationController?.popViewControllerAnimated(true)
            })
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel) { _ in })
    }
    
    @IBAction func doneButtonPressed() {
        self.presentViewController(alert, animated: true) { }
    }
}
