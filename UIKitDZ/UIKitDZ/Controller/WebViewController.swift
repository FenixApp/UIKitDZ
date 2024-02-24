// WebViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// Экран открытия ссылки сайта
final class WebViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let urlString = "https://www.spacex.com/vehicles/starship"
    }

    // MARK: - Private Properties

    private let webView = WKWebView()

    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .red
        button.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        loadRequest()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(webView)
        webView.addSubview(closeButton)
    }

    private func loadRequest() {
        guard let url = URL(string: Constants.urlString) else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }

    private func setupConstraints() {
        setupCloseButtonConstraints()
        setupWebViewConstraints()
    }

    @objc private func closeScreen() {
        dismiss(animated: true)
    }

    private func setupCloseButtonConstraints() {
        closeButton.topAnchor.constraint(equalTo: webView.topAnchor, constant: 20).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: webView.leadingAnchor, constant: 20).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func setupWebViewConstraints() {
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
