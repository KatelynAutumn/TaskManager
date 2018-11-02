//
//  ViewDetailsViewController.swift
//  TaskManager
//
//  Created by Katelyn Pace on 11/2/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import UIKit

class ViewDetailsViewController: UIViewController {
    
    
    var currentTask: Task!
    
    @IBOutlet weak var Details: UILabel!
    
    @IBOutlet weak var TitleDetails: UILabel!
    
    @IBOutlet weak var StatusDetails: UILabel!
    
    var taskTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if currentTask.Completed == true {
            taskTitle = "Completed"
        } else {
            taskTitle = "Uncompleted"
        }
        
        Details.text = currentTask.Details
        TitleDetails.text = currentTask.Title
        StatusDetails.text = taskTitle

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
