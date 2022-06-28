//
//  loggedInViewController.swift
//  firebase
//
//  Created by krishna on 28/06/22.
//

import UIKit

class loggedInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        let storyboard=UIStoryboard(name: "Main", bundle: nil)
        let vc=storyboard.instantiateViewController(withIdentifier: "ViewController")
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated: false)
    }
    

}
