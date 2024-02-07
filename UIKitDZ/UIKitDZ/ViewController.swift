// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Главный экран
class ViewController: UIViewController {
    let nameLabel = UILabel()

    override func viewDidAppear(_ animated: Bool) {
        alertGreeting(title: "Пожалуйста, представьтесь", message: "", style: .alert)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Background")
        backgroundImage.contentMode = .scaleToFill
        view.insertSubview(backgroundImage, at: 0)

        let nameLabelFrame = CGRect(x: 0, y: 0, width: 375, height: 82)
        nameLabel.frame = nameLabelFrame
        nameLabel.text = "Привет "
        view.addSubview(nameLabel)
    }

    func alertGreeting(title: String, message: String, style: UIAlertController.Style) {
        let alertGreeting = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Готово", style: .default) { _ in
            let text = alertGreeting.textFields?.first
        }

        alertGreeting.addTextField()
        alertGreeting.addAction(action)
        present(alertGreeting, animated: true, completion: nil)
    }
}
