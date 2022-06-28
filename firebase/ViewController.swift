//
//  ViewController.swift
//  firebase
//
//  Created by krishna on 28/06/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var emailInputTextField: UITextField!
    @IBOutlet weak var passwordInputTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func loginTapped(_ sender: Any) {
        print("login button tapped")
        validate()
    }
    
    @IBAction func createAccountButtonTapped(_ sender: Any) {
        print("Create account button tapped")
        let storyboard=UIStoryboard(name: "Main", bundle: nil)
        let vc=storyboard.instantiateViewController(withIdentifier: "signUpViewController")
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated: true)
    }
    func validate() {
        if emailInputTextField.text?.isEmpty == true{
            print("No text in Email Field")
            return
        }
        if passwordInputTextField.text?.isEmpty == true {
            print("No text in Password Field")
            return
        }
        login()
    }
    
    func login(){
        Auth.auth().signIn(withEmail: emailInputTextField.text!, password: passwordInputTextField.text!){ [weak self]
            authResult, error in
            guard let strongSelf = self else {return}
            if let error = error{
                print(error.localizedDescription)
            }
            self!.checkUserInfo()
        }
    }
    
    func checkUserInfo(){
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "loggedInViewController")
            vc.modalPresentationStyle = .overFullScreen
            present(vc,animated: true)
        }
    }
    
    
}

