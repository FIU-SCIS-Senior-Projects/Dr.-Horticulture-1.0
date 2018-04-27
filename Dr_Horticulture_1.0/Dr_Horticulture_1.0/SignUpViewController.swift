//
//  SignUpViewController.swift
//  Dr_Horticulture_1.0
//
//  Created by admin on 4/5/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rePasswordTextField: UITextField!
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var rePasswordErrorLabel: UILabel!
    @IBOutlet weak var passwordMatchErrorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailTextField.delegate = self
        passwordTextField.delegate = self
        rePasswordTextField.delegate = self
        
        emailErrorLabel.isHidden = true
        passwordErrorLabel.isHidden = true
        rePasswordErrorLabel.isHidden = true
        passwordMatchErrorLabel.isHidden = true
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

    @IBAction func handleSignUp(_ sender: Any) {
        
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        guard let rePassword = rePasswordTextField.text else {return}
        
        if email == "" {
            emailErrorLabel.isHidden = false
            return
        }
        else if password == "" {
            passwordErrorLabel.isHidden = false
            return
        }
        else if rePassword == "" {
            rePasswordErrorLabel.isHidden = false
            return
        }
        else if password != rePassword {
            passwordMatchErrorLabel.isHidden = false
            return
        }
        else {
            Auth.auth().createUser(withEmail: email, password: password) {user, error in
                if error == nil && user != nil {
                    print("User Created!")
                    self.dismiss(animated: false, completion: nil)
                    self.navigationController?.popViewController(animated: true)
                }
                else {
                    print("Error creating user: \(error?.localizedDescription)")
                }
            }
        }
        
    }
    
}
