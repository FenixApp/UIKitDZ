// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Главный экран
class ViewController: UIViewController {
    let frame = UIScreen.main.bounds
    let nameLabel = UILabel()
    let greetingView = UIView()
    let calculationButton = UIButton()
    let guessNumberButton = UIButton()

    override func viewDidAppear(_ animated: Bool) {
        alertGreeting(title: "Пожалуйста, представьтесь", message: "", style: .alert)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundImage = UIImageView(frame: frame)
        backgroundImage.image = UIImage(named: "Background")
        backgroundImage.frame = view.bounds
        view.addSubview(backgroundImage)

        let greetingViewSize = CGSize(width: frame.width, height: 100)
        let greetingViewPoint = CGPoint(x: 0, y: 50)
        greetingView.frame = CGRect(origin: greetingViewPoint, size: greetingViewSize)
        greetingView.backgroundColor = UIColor(named: "Greeting")
        greetingView.layer.borderWidth = 3
        greetingView.layer.borderColor = UIColor.white.cgColor
        greetingView.isHidden = true
        view.addSubview(greetingView)

        let nameLabelFrame = CGRect(x: 40, y: 50, width: 290, height: 102)
        nameLabel.frame = nameLabelFrame
        nameLabel.font = UIFont.boldSystemFont(ofSize: 40)
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.text = "Приветствую,\n"
        nameLabel.isHidden = true
        view.addSubview(nameLabel)

        guessNumberButton.frame = CGRect(x: 80, y: 290, width: 150, height: 150)
        guessNumberButton.backgroundColor = UIColor(named: "GuessButton")
        guessNumberButton.layer.borderWidth = 3
        guessNumberButton.layer.borderColor = UIColor(named: "GuessBorder")?.cgColor
        guessNumberButton.layer.cornerRadius = 30
        guessNumberButton.setTitle("Угадай число", for: .normal)
        guessNumberButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        guessNumberButton.titleLabel?.numberOfLines = 0
        guessNumberButton.titleLabel?.lineBreakMode = .byWordWrapping
        guessNumberButton.titleLabel?.textAlignment = .center
        guessNumberButton.clipsToBounds = true
        view.addSubview(guessNumberButton)

        calculationButton.frame = CGRect(x: 150, y: 490, width: 200, height: 200)
        calculationButton.backgroundColor = UIColor(named: "CalcButton")
        calculationButton.layer.borderWidth = 3
        calculationButton.layer.borderColor = UIColor(named: "CalcBorder")?.cgColor
        calculationButton.layer.cornerRadius = 30
        calculationButton.setTitle("Калькулятор", for: .normal)
        calculationButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        calculationButton.titleLabel?.numberOfLines = 0
        calculationButton.titleLabel?.lineBreakMode = .byWordWrapping
        calculationButton.titleLabel?.textAlignment = .center
        calculationButton.clipsToBounds = true
        view.addSubview(calculationButton)
    }

    func alertGreeting(title: String, message: String, style: UIAlertController.Style) {
        let alertGreeting = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Готово", style: .default) { _ in
            let text = alertGreeting.textFields?.first
            self.nameLabel.text? += (text?.text ?? "")
            self.greetingView.isHidden = false
            self.nameLabel.isHidden = false
        }

        alertGreeting.addTextField()
        alertGreeting.addAction(action)
        present(alertGreeting, animated: true, completion: nil)
    }
}
