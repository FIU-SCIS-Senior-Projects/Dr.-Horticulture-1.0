//
//  HomePageViewController.swift
//  Dr_Horticulture_1.0
//
//  Created by admin on 4/5/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class HomePageViewController: UIViewController, GIDSignInUIDelegate {
    
    

    @IBOutlet weak var logOutButton: UIBarButtonItem!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //add Google Sign In Button
        let GoogleButton = GIDSignInButton()
        GoogleButton.frame = CGRect(x: 16, y: 542, width: 360, height: 30)
        view.addSubview(GoogleButton)
        
        if let user = Auth.auth().currentUser {
            GoogleButton.isHidden = true
        }
        else {
            GoogleButton.isHidden = false
        }
        
        GIDSignIn.sharedInstance().uiDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let user = Auth.auth().currentUser {
            logInButton.isHidden = true
            signUpButton.isHidden = true
            
        }
        else {
            logInButton.isHidden = false
            signUpButton.isHidden = false
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func handelLogOut(_ sender: UIBarButtonItem) {
        try! GIDSignIn.sharedInstance().signOut()
        try! Auth.auth().signOut()
    }
    
    @IBAction func logInButtonTouchUpInside(_ sender: Any) {
        self.performSegue(withIdentifier: "showLogIn", sender: self)
    }
    
    @IBAction func SignUpButtonTouchUpInside(_ sender: Any) {
        self.performSegue(withIdentifier: "showSignUp", sender: self)
    }
    
}
