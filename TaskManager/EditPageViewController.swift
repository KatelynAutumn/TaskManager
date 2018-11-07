//
//  EditPageViewController.swift
//  TaskManager
//
//  Created by Katelyn Pace on 11/5/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import UIKit


class EditPageViewController: UIViewController {
    
    var selectedTask: Task!

    @IBOutlet weak var TitleField: UITextField!
    
    @IBOutlet weak var DetailsField: UITextView!
    
    @IBOutlet weak var Priority: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TitleField.text = selectedTask.Title
        DetailsField.text = selectedTask.Details
    
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
    
    func showErrorAlert() {
        let errorAlert = UIAlertController(title: "Error", message: "Please fill out all fields before resubmitting this task.", preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "Close", style: .default){
            _ in
        }
        errorAlert.addAction(dismissAction)
        self.present(errorAlert, animated: true, completion: nil)
    }

    

    @IBAction func EditTask(_ sender: Any) {
        let priority = Priority.selectedSegmentIndex
        guard let newTitle = TitleField.text, !newTitle.isEmpty,
        let newDetails = DetailsField.text, !newDetails.isEmpty
        else {
        showErrorAlert()
        return
        }
        selectedTask.Title = newTitle
        selectedTask.Details = newDetails
        selectedTask.Priority = priority
        self.performSegue(withIdentifier: "SubmitNewTask", sender: self)
    }
}
