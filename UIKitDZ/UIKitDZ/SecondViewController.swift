// SecondViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Экран с бронированием
class SecondViewController: UIViewController {
    @IBOutlet var fullNameTextfield: UITextField!
    @IBOutlet var numbersGuestsTextfield: UITextField!
    @IBOutlet var numberTableTextfield: UITextField!

    @IBOutlet var checkButton: UIButton!

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
