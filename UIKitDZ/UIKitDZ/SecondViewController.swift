// SecondViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class с экраном бронирования
class SecondViewController: UIViewController {
    // MARK: - IBOutlets
    
    @IBOutlet var fullNameTextfield: UITextField!
    @IBOutlet var numbersGuestsTextfield: UITextField!
    @IBOutlet var numberTableTextfield: UITextField!
    @IBOutlet var checkButton: UIButton!

    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkButton.layer.cornerRadius = 10
        checkButton.isEnabled = false

        fullNameTextfield.addTarget(self, action: #selector(changedTextFields), for: .editingChanged)
        numbersGuestsTextfield.addTarget(self, action: #selector(changedTextFields), for: .editingChanged)
        numberTableTextfield.addTarget(self, action: #selector(changedTextFields), for: .editingChanged)

        fullNameTextfield.addBottomBorder()
        numbersGuestsTextfield.addBottomBorder()
        numberTableTextfield.addBottomBorder()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Кафе Алиса"
    }
    
    // MARK: - IBAction

    // Сообщение о выставлении чека
    @IBAction func getCheckButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Выставить чек?", message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Отмена", style: .cancel)
        let okAction = UIAlertAction(title: "Чек", style: .default) { _ in
            self.performSegue(withIdentifier: "scoreVC", sender: self)
        }

        alert.addAction(cancel)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    // MARK: - Methods

    // Проверка на заполненность обязательных полей
    @objc func changedTextFields(_ sender: UIButton) {
        guard let fullName = fullNameTextfield.text,
              !fullName.isEmpty,
              let numbersGuests = numbersGuestsTextfield.text,
              !numbersGuests.isEmpty,
              let numberTable = numberTableTextfield.text,
              !numberTable.isEmpty
        else {
            checkButton.isEnabled = false
            return
        }
        checkButton.isEnabled = true
    }
}
