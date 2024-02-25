// StackTrafficLightViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран со светофором на StackView
final class StackTrafficLightViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let spacing: CGFloat = 10.0
    }

    // MARK: - Visual Components

    private let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let yellowView: UIView = {
        var view = UIView()
        view.backgroundColor = .systemYellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var colorsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [redView, yellowView, greenView])
        stack.spacing = Constants.spacing
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
//        setCircles()
    }

    // MARK: Private Methods

    private func setupView() {
        view.addSubview(blackView)
        blackView.addSubview(colorsStackView)
    }

    private func setCircles() {
        let isLandscape = view.bounds.size.width > view.bounds.size.height
        let heightYellowView = isLandscape ? view.bounds.size.width * 0.21 : view.bounds.size.height * 0.2
        redView.layer.cornerRadius = heightYellowView / 2
        yellowView.layer.cornerRadius = heightYellowView / 2
        greenView.layer.cornerRadius = heightYellowView / 2
    }

    private func setupConstraints() {
        blackView.topAnchor.constraint(equalTo: colorsStackView.topAnchor, constant: -15).isActive = true
        blackView.bottomAnchor.constraint(equalTo: colorsStackView.bottomAnchor, constant: 15).isActive = true
        blackView.leadingAnchor.constraint(equalTo: colorsStackView.leadingAnchor, constant: -25).isActive = true
        blackView.trailingAnchor.constraint(equalTo: colorsStackView.trailingAnchor, constant: 25).isActive = true

        colorsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        colorsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        colorsStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        colorsStackView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
    }

    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
