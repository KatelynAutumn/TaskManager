//
//  AddGameViewController.swift
//  TaskManager
//
//  Created by Katelyn Pace on 10/30/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import UIKit



class AddGameViewController: UIViewController {

    @IBOutlet weak var NewTitle: UITextField!
    
    @IBOutlet weak var NewDetails: UITextView!
    
    
    var newTask: Task!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let destination = segue.destination as? ViewController {
            TaskManager.sharedInstance.allTasks[0].append(newTask)
            destination.TableView.reloadData()
        }
    }

    func showErrorAlert() {
        let errorAlert = UIAlertController(title: "Error", message: "Please fill out all fields before submitting this task.", preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "Close", style: .default)
        errorAlert.addAction(dismissAction)
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func SubmitButtonTapped(_ sender: Any) {
        guard let title = NewTitle.text, !title.isEmpty,
            let details = NewDetails.text, !details.isEmpty
                else {
                showErrorAlert()
                return
        }
        newTask = Task(Title: title, Details: details, Completed: false, CompleteDate: nil)
        
        self.performSegue(withIdentifier: "unwindToTaskList", sender: self)
    }
}
