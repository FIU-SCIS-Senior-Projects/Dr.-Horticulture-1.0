//
//  LogInViewController.swift
//  Dr_Horticulture_1.0
//
//  Created by admin on 4/5/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import Firebase

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        emailErrorLabel.isHidden = true
        passwordErrorLabel.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func handelLogIn(_ sender: UIButton) {
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        if email == "" {
            emailErrorLabel.isHidden = false
            return
        }
        else if password == "" {
            passwordErrorLabel.isHidden = false
            return
        }
        else {
            Auth.auth().signIn(withEmail: email, password: password) { user, error in
                if error == nil && user != nil {
                    self.dismiss(animated: false, completion: nil)
                    self.navigationController?.popViewController(animated: true)
                }
                else {
                    print("Error logging in: \(error?.localizedDescription)")
                }
            }
        }
    }
    
}
