//
//  ViewController.swift
//  Client GitHub
//
//  Created by Max on 28.11.16.
//  Copyright © 2016 Max. All rights reserved.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLoginTouched(_ sender: AnyObject) {
        let user = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        AuthData.sharedInstance.login(user: user, password: password) { (isSuccess) in
            if isSuccess {
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let vc = storyboard.instantiateViewController(withIdentifier: "RepositoryList")
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                let alertController = UIAlertController(title: "Error", message: "Invalid credentials", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                self.show(alertController, sender: nil)
            }
        }
    }

}

