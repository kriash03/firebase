//
//  loggedInViewController.swift
//  firebase
//
//  Created by krishna on 28/06/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class loggedInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        let firebaseAuth = Auth.auth()
            do {
              try firebaseAuth.signOut()
                let storyboard=UIStoryboard(name: "Main", bundle: nil)
                let vc=storyboard.instantiateViewController(withIdentifier: "home")
                vc.modalPresentationStyle = .overFullScreen
                present(vc,animated: false)
            } catch let signOutError as NSError {
              print("Error signing out: %@", signOutError)
            }
    }
    

}
