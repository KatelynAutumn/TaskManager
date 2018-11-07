//
//  ViewController.swift
//  TaskManager
//
//  Created by Katelyn Pace on 10/30/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import UIKit




class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var TableView: UITableView!
    
    
    var currentTask: Task!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return TaskManager.sharedInstance.allTasks[0].count
        case 1:
            return TaskManager.sharedInstance.allTasks[1].count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as! UncompletedTaskTableViewCell
        let taskAtIndex = TaskManager.sharedInstance.allTasks[indexPath.section][indexPath.row]
        cell.TaskTitle.text = taskAtIndex.Title
        if taskAtIndex.Completed {
            cell.CompletedStatus.text = "Complete"
            taskAtIndex.CompleteDate = nil
        } else {
            cell.CompletedStatus.text = "Uncompleted"
        }
        if taskAtIndex.CompleteDate == nil {
            cell.DueDate.text = " "
        } else {
            cell.DueDate.text = taskAtIndex.CompleteDate
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            if TaskManager.sharedInstance.allTasks[0].count == 0 {
                return "There are no uncompleted tasks."
            } else {
                return "Uncompleted"
            }
        case 1:
            if TaskManager.sharedInstance.allTasks[1].count == 0 {
                return "There are no completed tasks."
            } else {
            return "Completed"
            }
        default:
            return nil
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        TaskManager.sharedInstance.sortArrays()
        TableView.reloadData()
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewDetailsViewController {
            //We need to pass through the Game that we'll be editing.
            destination.currentTask = currentTask
        }
        if let destination = segue.destination as? EditPageViewController {
            destination.selectedTask = currentTask
        }
        if let destination = segue.destination as? CompleteViewController {
            destination.Task = currentTask
        }
        if let destination = segue.destination as? AddGameViewController {
            destination.newTask = currentTask
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentTask = TaskManager.sharedInstance.getTask(at: indexPath.section, row: indexPath.row)
        self.performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteTask = UITableViewRowAction(style: .destructive, title: "Delete") { _, _ in
            TaskManager.sharedInstance.removeTask(section: indexPath.section, row: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let taskForIndex = TaskManager.sharedInstance.getTask(at: indexPath.section, row: indexPath.row)
        let title = taskForIndex.Completed ? "Uncompleted" : "Completed"
        let checkComplete = UITableViewRowAction(style: .normal, title: title) { _,_ in
            self.currentTask = TaskManager.sharedInstance.getTask(at: indexPath.section, row: indexPath.row)
            if taskForIndex.Completed == true {
                TaskManager.sharedInstance.completeGame(section: indexPath.section, row: indexPath.row)
                self.performSegue(withIdentifier: "CheckComplete", sender: self)
            } else {
            TaskManager.sharedInstance.completeGame(section: indexPath.section, row: indexPath.row)
            tableView.reloadData()
            }
        }
        let editTask = UITableViewRowAction(style: .normal, title: "Edit") { _,_ in
            self.currentTask = TaskManager.sharedInstance.getTask(at: indexPath.section, row: indexPath.row)
            self.performSegue(withIdentifier: "ShowEditScreen", sender: self)
        }
        
        deleteTask.backgroundColor = UIColor.red
        checkComplete.backgroundColor = UIColor.gray
        editTask.backgroundColor = UIColor.red
        
        
        return [deleteTask, checkComplete, editTask]
        
    }
    
    

    
    @IBAction func unwindToTaskList(segue: UIStoryboardSegue) { }
    

}

