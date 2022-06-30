//
//  ViewController.swift
//  firebase
//
//  Created by krishna on 28/06/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import FacebookLogin
import FBSDKLoginKit

class ViewController: UIViewController, LoginButtonDelegate {
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let credential = FacebookAuthProvider
          .credential(withAccessToken: AccessToken.current!.tokenString)
        print("Successful Facebook Log In")

                Auth.auth().signIn(with: credential) { [self] authResult, error in
                      if let error = error{
                          print(error.localizedDescription)
                      }
                    self.checkUserInfo()
                  }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("logged out")
    }
    

    @IBOutlet weak var emailInputTextField: UITextField!
    @IBOutlet weak var passwordInputTextField: UITextField!
    
    @IBOutlet weak var fbLoginTapped: FBLoginButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let loginButton = FBLoginButton()
                loginButton.delegate = self
       
    }
    //private func setupGoogle(){
        //GIDSignIn.sharedInstance().presentingViewController = self
    //}

    
//
//        let loginButton = FBLoginButton()
//                loginButton.center = view.center
//                view.addSubview(loginButton)
        
//        let loginButton = FBLoginButton()
//        loginButton.delegate = self
//        func loginButton(_ loginButton: FBLoginButton!, didCompleteWith result: LoginManagerLoginResult!, error: Error!) {
//          if let error = error {
//            print(error.localizedDescription)
//            return
//          }
//          // ...
//        }
//
    //}
    
    @IBAction func googleSignIn(_ sender: Any) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in

          if let error = error {
            // ...
            return
          }

          guard
            let authentication = user?.authentication,
            let idToken = authentication.idToken
          else {
            return
          }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken:authentication.accessToken)
            print("google login successful")
            Auth.auth().signIn(with: credential)
            {
                authResult, error in
                
                if let error = error{
                    print(error.localizedDescription)
                }
                checkUserInfo()

          // ...
        }
    }
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


