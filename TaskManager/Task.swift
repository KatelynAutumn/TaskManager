//
//  Task.swift
//  TaskManager
//
//  Created by Katelyn Pace on 10/30/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import Foundation


class Task {
    var Title: String
    var Details: String
    var Completed: Bool
    var CompleteDate: String?
    var Priority: Int
    
    init(Title: String, Details: String, Completed: Bool, CompleteDate: String?, Priority: Int) {
        self.Title = Title
        self.Details = Details
        self.Completed = Completed
        self.Priority = Priority 
    }
    
}
