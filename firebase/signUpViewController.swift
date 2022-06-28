//
//  signUpViewController.swift
//  firebase
//
//  Created by krishna on 28/06/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class signUpViewController: UIViewController {

    @IBOutlet weak var emailInputTextField: UITextField!
    @IBOutlet weak var passwordInputTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        print("signup button tapped")
        if emailInputTextField.text?.isEmpty == true{
            print("No Text in Email Field")
            return
        }
        if passwordInputTextField.text?.isEmpty == true{
            print("No Text in Password Field")
            return
        }
        signUp()
        
    }
    
    @IBAction func alreadyHaveAccountButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    func signUp() {
        Auth.auth().createUser(withEmail: emailInputTextField.text!, password: passwordInputTextField.text!){authResult,
            error in
            guard let user=authResult?.user, error==nil else{
                print("Error \(error?.localizedDescription)")
                return
            }
            
            let storyboard=UIStoryboard(name: "Main", bundle: nil)
            let vc=storyboard.instantiateViewController(withIdentifier: "ViewController")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
            return
        }
    }
   

}
