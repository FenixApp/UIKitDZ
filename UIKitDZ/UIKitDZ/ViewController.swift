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
        alertGreeting(title: "Пожалуйста,\n представьтесь", message: "", style: .alert)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setBackground()
        setGreetingView()
        setNameLabel()
        setGuessNumberButton()
        setCalculateButton()
    }

    func setBackground() {
        let backgroundImage = UIImageView(frame: frame)
        backgroundImage.image = UIImage(named: "Background")
        backgroundImage.frame = view.bounds
        view.addSubview(backgroundImage)
    }

    func setGreetingView() {
        let greetingViewSize = CGSize(width: frame.width, height: 100)
        let greetingViewPoint = CGPoint(x: 0, y: 50)
        greetingView.frame = CGRect(origin: greetingViewPoint, size: greetingViewSize)
        greetingView.backgroundColor = UIColor(named: "Greeting")
        greetingView.layer.borderWidth = 3
        greetingView.layer.borderColor = UIColor.white.cgColor
        greetingView.isHidden = true
        view.addSubview(greetingView)
    }

    func setNameLabel() {
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
    }

    func setGuessNumberButton() {
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
    }

    func setCalculateButton() {
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
        calculationButton.addTarget(self, action: #selector(calculateNumbers), for: .allEvents)
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

        alertGreeting.addTextField { textField in
            textField.placeholder = "Введите ваше имя"
        }
        alertGreeting.addAction(action)
        present(alertGreeting, animated: true, completion: nil)
    }

    func resultCalculateNumbers(title: String, message: String, style: UIAlertController.Style) {
        let alertResult = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        alertResult.addAction(okAction)
        alertResult.addAction(cancelAction)
        present(alertResult, animated: true)
    }

    @objc private func calculateNumbers() {
        let alertCalculateNumbers = UIAlertController(title: "Введите ваши числа", message: nil, preferredStyle: .alert)
        let actionNumbers = UIAlertAction(title: "Сложить", style: .default) { _ in
            let numberOne = alertCalculateNumbers.textFields?.first?.text
            let intNumberOne = Int(numberOne ?? "nil")
            let numberTwo = alertCalculateNumbers.textFields?.last?.text
            let intNumberTwo = Int(numberTwo ?? "nil")
            let sum = (intNumberOne ?? 0) + (intNumberTwo ?? 0)

            self.resultCalculateNumbers(title: "Ваш результат", message: String(sum), style: .alert)
        }

        alertCalculateNumbers.addTextField { textField in
            textField.placeholder = "Число 1"
        }
        alertCalculateNumbers.addTextField { textField in
            textField.placeholder = "Число 2"
        }
        _ = UIAlertAction(title: "Отмена", style: .cancel)

        alertCalculateNumbers.addAction(actionNumbers)
        present(alertCalculateNumbers, animated: true, completion: nil)
    }
}
