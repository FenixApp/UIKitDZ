// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class со стартовым экраном приложения
class ViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet var mailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!

    // MARK: - Overide Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 10
        loginButton.isEnabled = false

        mailTextField.addTarget(self, action: #selector(changedTextFields), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(changedTextFields), for: .editingChanged)

        mailTextField.addBottomBorder()
        passwordTextField.addBottomBorder()
    }
    
    // MARK: - IBAction

    @IBAction func loginButtonTapped(_ sender: UIButton) {}

    // MARK: - Methods
    
    @objc func changedTextFields(_ textField: UITextField) {
        guard let mail = mailTextField.text,
              !mail.isEmpty,
              let password = passwordTextField.text,
              !password.isEmpty
        else {
            loginButton.isEnabled = false
            return
        }
        loginButton.isEnabled = true
        loginButton.layer.backgroundColor = UIColor(named: "Active")?.cgColor
    }
}

// MARK: - Extensions

extension UITextField {
    func addBottomBorder() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: frame.size.height - 1, width: frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}
