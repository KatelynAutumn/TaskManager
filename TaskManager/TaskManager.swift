//
//  TaskManager.swift
//  TaskManager
//
//  Created by Katelyn Pace on 10/31/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import Foundation

class TaskManager {
    static let sharedInstance = TaskManager()

    private init() {
        let testOne = Task(Title: "Grocery-Shopping", Details: "sdfsd", Completed: false, CompleteDate: nil)
        let testTwo = Task(Title: "BLAH BLAH", Details: "ANNOYED", Completed: true, CompleteDate: nil)
        
        allTasks = [[testOne], [testTwo]]
    }
    
    
    var allTasks: [[Task]] = []

    
    func getTaskCount(in section: Int) -> Int {
        return allTasks[section].count
    }
    
    func getTask(at section: Int, row: Int) -> Task {
        return allTasks[section][row]
    }
    
   
    func removeTask(section: Int, row: Int) -> Task {
        return allTasks[section].remove(at: row)
    }
    
    
    func completeGame(section: Int, row: Int) {
        let taskForIndex = allTasks[section][row]
        
        if taskForIndex.Completed {
            let removedTask = removeTask(section: section, row: row)
            allTasks[0].append(removedTask)
            taskForIndex.Completed = false
        } else {
            let removedTask = removeTask(section: section, row: row)
            allTasks[1].append(removedTask)
            taskForIndex.Completed = true
            
        }
    }
}
