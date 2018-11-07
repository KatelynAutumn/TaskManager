//
//  CompleteViewController.swift
//  TaskManager
//
//  Created by Katelyn Pace on 11/5/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    
    var Task: Task!
    
    @IBOutlet weak var ChangeStatus: UISegmentedControl!
    
    @IBOutlet weak var DatePicker: UIDatePicker!
    
    @IBOutlet weak var Priority: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DatePicker.isEnabled = false
        

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

    @IBAction func CheckComplete(_ sender: Any) {
        
        switch ChangeStatus.selectedSegmentIndex {
        case 0:
            Task.Completed = true
            DatePicker.isEnabled = false
        case 1:
            Task.Completed = false
            DatePicker.isEnabled = true
        default:
            return
        }
    }
    
  
    
    
    @IBAction func SubmitChange(_ sender: Any) {
        let priority = Priority.selectedSegmentIndex
        let dateFormatr = DateFormatter()
        dateFormatr.dateFormat = "MM/dd/yyyy"
        let stringDate = dateFormatr.string(from: (DatePicker.date))
        Task.CompleteDate = stringDate
        Task.Priority = priority
        self.performSegue(withIdentifier: "SubmitDueDate", sender: self)
    }
    
}
