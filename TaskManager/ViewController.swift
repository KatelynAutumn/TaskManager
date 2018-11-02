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
        } else {
            cell.CompletedStatus.text = "Uncompleted"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Uncompleted"
        case 1:
            return "Completed"
        default:
            return nil
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        TableView.reloadData()
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewDetailsViewController {
            //We need to pass through the Game that we'll be editing.
            destination.currentTask = currentTask
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
            TaskManager.sharedInstance.completeGame(section: indexPath.section, row: indexPath.row)
            tableView.reloadData()
        }
        
        
        

        
        return [deleteTask, checkComplete]
        
    }
    
    

    
    @IBAction func unwindToTaskList(segue: UIStoryboardSegue) { }
    

}

