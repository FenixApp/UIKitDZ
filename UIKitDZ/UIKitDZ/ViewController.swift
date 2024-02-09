// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Описание
class ViewController: UIViewController {
    
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    override func viewDidLoad() {
        loginButton.layer.cornerRadius = 10
        
        
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
    }
}
