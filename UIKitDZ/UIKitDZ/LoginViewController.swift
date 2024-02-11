// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с вводом логина и пароля
class LoginViewController: UIViewController {
    private let calendarImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Birthday")
        imageView.frame = CGRect(x: 130, y: 50, width: 125, height: 125)
        return imageView
    }()

    private let birthdayLabel: UILabel = {
        let label = UILabel()
        label.text = "Birthday\nReminder"
        label.numberOfLines = 0
        label.frame = CGRect(x: 150, y: 180, width: 175, height: 44)
        label.font = UIFont(name: "Verdana-bold", size: 18)
        label.textColor = UIColor(red: 90 / 255, green: 67 / 255, blue: 148 / 255, alpha: 1)
        return label
    }()

    private let signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.frame = CGRect(x: 20, y: 250, width: 175, height: 31)
        label.font = UIFont(name: "Verdana-bold", size: 26)
        label.textColor = UIColor(red: 233 / 255, green: 70 / 255, blue: 94 / 255, alpha: 1)
        return label
    }()

    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.frame = CGRect(x: 20, y: 300, width: 175, height: 19)
        label.font = UIFont(name: "Verdana-bold", size: 16)
        label.textColor = UIColor(red: 233 / 255, green: 70 / 255, blue: 94 / 255, alpha: 1)
        return label
    }()

    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = .init(string: "Typing email")
        textField.frame = CGRect(x: 20, y: 330, width: 175, height: 17)
        textField.font = UIFont(name: "Verdana", size: 14)
        return textField
    }()

    private let emailUnderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.frame = CGRect(x: 20, y: 355, width: 345, height: 1)
        return view
    }()

    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.frame = CGRect(x: 20, y: 370, width: 175, height: 19)
        label.font = UIFont(name: "Verdana-bold", size: 16)
        label.textColor = UIColor(red: 233 / 255, green: 70 / 255, blue: 94 / 255, alpha: 1)
        return label
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = .init(string: "Typing password")
        textField.frame = CGRect(x: 20, y: 400, width: 175, height: 17)
        textField.font = UIFont(name: "Verdana", size: 14)
        textField.isSecureTextEntry = true
        return textField
    }()

    private lazy var eyeButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(eyeButtonTapped), for: .touchUpInside)
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        button.tintColor = .lightGray
        button.frame = CGRect(x: 340, y: 400, width: 22, height: 19)
        return button
    }()

    private let passwordlUnderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.frame = CGRect(x: 20, y: 425, width: 345, height: 1)
        return view
    }()

    private let switchLabel: UILabel = {
        let label = UILabel()
        label.text = "Use FaceID"
        label.frame = CGRect(x: 130, y: 550, width: 150, height: 35)
        label.font = UIFont(name: "Verdana-bold", size: 16)
        label.textColor = .black
        label.isHidden = true
        return label
    }()

    private let switchFaceID: UISwitch = {
        let faceID = UISwitch()
        faceID.isOn = true
        faceID.frame = CGRect(x: 270, y: 550, width: 54, height: 35)
        faceID.isHidden = true
        return faceID
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.tintColor = .white
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.backgroundColor = UIColor(red: 233 / 255, green: 70 / 255, blue: 94 / 255, alpha: 0.4)
        button.setTitle("Login", for: .normal)
        button.frame = CGRect(x: 20, y: 700, width: 345, height: 44)
        return button
    }()

    override func viewDidLoad() {
        setElements()
        statusTextFields()
    }

    private func setElements() {
        view.addSubview(calendarImage)
        view.addSubview(birthdayLabel)
        view.addSubview(signInLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(emailUnderView)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(eyeButton)
        view.addSubview(passwordlUnderView)
        view.addSubview(switchLabel)
        view.addSubview(switchFaceID)
        view.addSubview(loginButton)
    }

    private func statusTextFields() {
        emailTextField.addTarget(self, action: #selector(changedTextFields), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(changedTextFields), for: .editingChanged)
    }

    @objc private func changedTextFields(_ textField: UITextField) {
        guard let email = emailTextField.text,
              !email.isEmpty,
              let password = passwordTextField.text,
              !password.isEmpty
        else {
            loginButton.isEnabled = false
            return
        }
        loginButton.isEnabled = true
        switchLabel.isHidden = false
        switchFaceID.isHidden = false
        loginButton.layer.backgroundColor = UIColor(red: 233 / 255, green: 70 / 255, blue: 94 / 255, alpha: 1).cgColor
    }

    @objc func eyeButtonTapped(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        if passwordTextField.isSecureTextEntry {
            if let image = UIImage(systemName: "eye.slash.fill") {
                sender.setImage(image, for: .normal)
            }
        } else {
            if let image = UIImage(systemName: "eye.fill") {
                sender.setImage(image, for: .normal)
            }
        }
    }

    @objc func loginButtonTapped() {
        let listViewController = ListViewController()
        navigationController?.pushViewController(listViewController, animated: true)
    }
}
