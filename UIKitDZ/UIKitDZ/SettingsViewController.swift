// SettingsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Настройки карточки человека
class SettingsViewController: UIViewController {
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 20, y: 20, width: 50, height: 20)
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        return button
    }()

    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 330, y: 20, width: 50, height: 20)
        button.setTitle("Add", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        return button
    }()

    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Person")
        imageView.frame = CGRect(x: 130, y: 70, width: 125, height: 125)
        return imageView
    }()

    private let changePhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Change photo", for: .normal)
        button.frame = CGRect(x: 130, y: 210, width: 125, height: 20)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        return button
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Surname"
        label.frame = CGRect(x: 20, y: 250, width: 175, height: 19)
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = .init(string: "Typing Name Surname")
        textField.frame = CGRect(x: 20, y: 280, width: 175, height: 17)
        textField.font = UIFont(name: "Verdana", size: 14)
        return textField
    }()

    private let nameUnderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.frame = CGRect(x: 20, y: 305, width: 345, height: 1)
        return view
    }()

    private let birthdayLabel: UILabel = {
        let label = UILabel()
        label.text = "Birthday"
        label.frame = CGRect(x: 20, y: 330, width: 175, height: 19)
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    private let birthdayTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = .init(string: "Typing Date of Birth")
        textField.frame = CGRect(x: 20, y: 360, width: 175, height: 17)
        textField.font = UIFont(name: "Verdana", size: 14)
        return textField
    }()

    private let birthdayUnderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.frame = CGRect(x: 20, y: 385, width: 345, height: 1)
        return view
    }()

    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Age"
        label.frame = CGRect(x: 20, y: 410, width: 175, height: 19)
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    private let ageTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = .init(string: "Typing age")
        textField.frame = CGRect(x: 20, y: 440, width: 175, height: 17)
        textField.font = UIFont(name: "Verdana", size: 14)
        return textField
    }()

    private let ageUnderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.frame = CGRect(x: 20, y: 465, width: 345, height: 1)
        return view
    }()

    private let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Gender"
        label.frame = CGRect(x: 20, y: 490, width: 175, height: 19)
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    private let genderTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = .init(string: "Indicate Gender")
        textField.frame = CGRect(x: 20, y: 520, width: 175, height: 17)
        textField.font = UIFont(name: "Verdana", size: 14)
        return textField
    }()

    private let genderUnderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.frame = CGRect(x: 20, y: 545, width: 345, height: 1)
        return view
    }()

    private let telegramLabel: UILabel = {
        let label = UILabel()
        label.text = "Telegram"
        label.frame = CGRect(x: 20, y: 570, width: 175, height: 19)
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    private let telegramTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = .init(string: "Typing Telegram")
        textField.frame = CGRect(x: 20, y: 600, width: 175, height: 17)
        textField.font = UIFont(name: "Verdana", size: 14)
        return textField
    }()

    private let telegramUnderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.frame = CGRect(x: 20, y: 625, width: 345, height: 1)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setElements()
    }

    func setElements() {
        view.addSubview(cancelButton)
        view.addSubview(addButton)
        view.addSubview(photoImageView)
        view.addSubview(changePhotoButton)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(nameUnderView)
        view.addSubview(birthdayLabel)
        view.addSubview(birthdayTextField)
        view.addSubview(birthdayUnderView)
        view.addSubview(ageLabel)
        view.addSubview(ageTextField)
        view.addSubview(ageUnderView)
        view.addSubview(genderLabel)
        view.addSubview(genderTextField)
        view.addSubview(genderUnderView)
        view.addSubview(telegramLabel)
        view.addSubview(telegramTextField)
        view.addSubview(telegramUnderView)
    }
}
