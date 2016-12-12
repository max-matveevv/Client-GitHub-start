//
//  ViewController.swift
//  Client GitHub
//
//  Created by Max on 28.11.16.
//  Copyright © 2016 Max. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class MainViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
     // MARK: Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view, typically from a nib.
        
        
        loginButton.layer.masksToBounds = true
        loginButton.tintColor = UIColor(red: 100, green: 25, blue: 31, alpha: 1)
        loginButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 16)
        loginButton.titleLabel?.textAlignment = .center
        loginButton.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: App Delegates
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        }
        else if textField == passwordTextField {
            onLoginTouched(loginButton)
        }
        
        return true
    }

    // MARK: Button Actions

    @IBAction func onLoginTouched(_ sender: AnyObject) {
        
        let user = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        SVProgressHUD.show()
        
        API.sharedInstance.login(user: user, password: password) { (isSuccess) in
            
            
            if isSuccess {
                SVProgressHUD.dismiss()
            
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let vc = storyboard.instantiateViewController(withIdentifier: "RepositoryListVC")
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                SVProgressHUD.dismiss()
                let alertController = UIAlertController(title: "Error", message: "Invalid credentials", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                self.show(alertController, sender: nil)
            }
        }
    }

}

