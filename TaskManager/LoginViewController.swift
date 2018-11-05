//
//  LoginViewController.swift
//  TaskManager
//
//  Created by Katelyn Pace on 11/4/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    var setUsername = "KatelynAutumn"
    var setPassword = "password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    func showErrorAlert() {
        let errorAlert = UIAlertController(title: "Incorrect", message: "Please re-enter the username and password.", preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "Close", style: .default)
        errorAlert.addAction(dismissAction)
        self.present(errorAlert, animated: true, completion: nil)
    }
    

    @IBAction func Login(_ sender: Any) {
        if username.text != setUsername || password.text != setPassword {
            showErrorAlert()
        } else {
            self.performSegue(withIdentifier: "SegueToMainPage", sender: self)
        }
        
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
