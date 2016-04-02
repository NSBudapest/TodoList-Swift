//
//  TodoListViewController.swift
//  TodoList
//
//  Created by Vásárhelyi Ágnes on 01/04/16.
//  Copyright © 2016 NSBudapest. All rights reserved.
//

import UIKit

protocol TodoItemDelegate {
    func deleteTodoItem(object: String)
}

class TodoListViewController: UITableViewController, TodoItemDelegate {
    
    var items = [ "Learn KIF",
                  "See how Xcode UI testing works",
                  "Check out FBSnapshot" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(TodoListViewController.insertNewItem(_:)))
        self.navigationItem.rightBarButtonItem = addButton
        self.navigationItem.leftBarButtonItem?.accessibilityLabel = "Back"
        self.navigationItem.rightBarButtonItem?.accessibilityLabel = "Add"
        self.tableView.accessibilityLabel = "tableView"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    func insertNewItem(sender: AnyObject) {
        let indexPath = NSIndexPath(forRow: items.count, inSection: 0)
        items.append("Anything else?")
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TodoCell", forIndexPath: indexPath)
        
        let object = items[indexPath.row]
        cell.textLabel!.text = object
        cell.accessibilityLabel = "\(object) \(indexPath.row)"
        cell.accessoryView?.accessibilityLabel = "Delete"
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            items.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showWhatTodo" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = items[indexPath.row]
                let todoViewController = segue.destinationViewController as! TodoViewController
                todoViewController.todoItem = object
                todoViewController.delegate = self
            }
        }
    }
    
    // Mark: - TodoItemDelegate
    
    func deleteTodoItem(object: String) {
        items.removeAtIndex(items.indexOf(object)!)
    }
    
}

