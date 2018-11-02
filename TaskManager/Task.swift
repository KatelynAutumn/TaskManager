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
    var CompleteDate: Date?
    
    init(Title: String, Details: String, Completed: Bool, CompleteDate: Date?) {
        self.Title = Title
        self.Details = Details
        self.Completed = Completed
    }
    
}
