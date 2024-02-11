// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ViewController с основным экраном приложения
final class ViewController: UIViewController {
    
    // MARK: - Public Properties
    
    private let frame = UIScreen.main.bounds
    private let nameLabel = UILabel()
    private let greetingView = UIView()
    private let calculationButton = UIButton()
    private let guessNumberButton = UIButton()

    // MARK: - Override Methods
    
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
    
    // MARK: - Private methods

    // Настройка фона
    private func setBackground() {
        let backgroundImage = UIImageView(frame: frame)
        backgroundImage.image = UIImage(named: "Background")
        backgroundImage.frame = CGRect(x: 0, y: 60 - view.safeAreaInsets.top, width: frame.width, height: frame.height)
        view.addSubview(backgroundImage)
    }

    // Настройка подложки для приветствия
    private func setGreetingView() {
        let greetingViewSize = CGSize(width: frame.width, height: 100)
        let greetingViewPoint = CGPoint(x: 0, y: 50)
        greetingView.frame = CGRect(origin: greetingViewPoint, size: greetingViewSize)
        greetingView.backgroundColor = UIColor(named: "Greeting")
        greetingView.layer.borderWidth = 3
        greetingView.layer.borderColor = UIColor.white.cgColor
        greetingView.isHidden = true
        view.addSubview(greetingView)
    }

    // Настройка текста приветствия
    private func setNameLabel() {
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

    // Настройка кнопки "Угадай число"
    private func setGuessNumberButton() {
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
        guessNumberButton.addTarget(self, action: #selector(guessNumber), for: .allEvents)
        view.addSubview(guessNumberButton)
    }

    // Настройка кнопки "Калькулятор"
    private func setCalculateButton() {
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

    // Настройка аллерта приветствия
    private func alertGreeting(title: String, message: String, style: UIAlertController.Style) {
        let alertGreeting = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Готово", style: .default) { _ in
            let text = alertGreeting.textFields?.first
            self.nameLabel.text? += (text?.text ?? "") + "!"
            self.greetingView.isHidden = false
            self.nameLabel.isHidden = false
        }

        alertGreeting.addTextField { textField in
            textField.placeholder = "Введите ваше имя"
        }
        alertGreeting.addAction(action)
        present(alertGreeting, animated: true, completion: nil)
    }

    // Итоговый аллерт "Сложение чисел"
    private func resultCalculateNumbers(title: String, message: String, style: UIAlertController.Style) {
        let alertResult = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        alertResult.addAction(okAction)
        alertResult.addAction(cancelAction)
        present(alertResult, animated: true)
    }

    // Итоговый аллерт "Угадай число"
    private func resultGuessNumber(title: String, message: String, style: UIAlertController.Style) {
        let alertResult = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alertResult.addAction(okAction)
        present(alertResult, animated: true)
    }

    // Функция с аллертом "Сложение чисел"
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
        let actionCancel = UIAlertAction(title: "Отмена", style: .cancel)

        alertCalculateNumbers.addAction(actionNumbers)
        alertCalculateNumbers.addAction(actionCancel)

        alertCalculateNumbers.addTextField { textField in
            textField.placeholder = "Число 1"
        }
        alertCalculateNumbers.addTextField { textField in
            textField.placeholder = "Число 2"
        }

        present(alertCalculateNumbers, animated: true, completion: nil)
    }

    // Функция с аллертом "Угадай число"
    @objc private func guessNumber() {
        let alertGuessNumber = UIAlertController(title: "Угадай число от 1 до 10", message: nil, preferredStyle: .alert)
        let actionGuess = UIAlertAction(title: "Ок", style: .default) { _ in
            let randomNumber = Int.random(in: 1 ... 10)
            let text = alertGuessNumber.textFields?.first
            if text?.text == String(randomNumber) {
                self.resultGuessNumber(title: "Поздравляю!", message: "Вы угадали", style: .alert)
            } else {
                self.resultGuessNumber(title: "Упс!", message: "Это неверный ответ", style: .alert)
            }
        }
        let actionCancel = UIAlertAction(title: "Отмена", style: .cancel)

        alertGuessNumber.addTextField { textField in
            textField.placeholder = "Введите число"
        }

        alertGuessNumber.addAction(actionGuess)
        alertGuessNumber.addAction(actionCancel)
        present(alertGuessNumber, animated: true, completion: nil)
    }
}
