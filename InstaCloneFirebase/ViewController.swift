//
//  ViewController.swift
//  InstaCloneFirebase
//
//  Created by Furkan Vardar on 15.12.2021.
//

import UIKit
import Firebase
import CoreMedia
class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func signinClicked(_ sender: Any) {
        if emailText.text != "" && passwordText.text != ""{
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                if error != nil
                {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "ERROR")
                }
                else
                {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
        else
        {
            makeAlert(titleInput: "Error!", messageInput: "Email/Password is Empty.")
        }
    }
    
    @IBAction func signupClicked(_ sender: Any) {
        if emailText.text != "" && passwordText.text != ""
        {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                if error != nil
                {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "ERROR")
                }
                else
                {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
        else {
            makeAlert(titleInput: "Error!", messageInput: "Email/Password is Empty.")
        }
    }
    
    func makeAlert(titleInput : String, messageInput : String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

