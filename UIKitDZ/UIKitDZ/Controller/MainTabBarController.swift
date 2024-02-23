// MainTabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Таб бар контроллер, инициализирует запуск стартовых экранов приложения по вкладкам
class MainTabBarController: UITabBarController {
    // MARK: - Constants

    private enum Constants {
        static let feedViewControllerTitle = "Лента"
        static let feedViewControllerImage = UIImage(named: "feed")
        static let feedViewControllerSelectedImage = UIImage(named: "house")

        static let noticeViewControllerTitle = "Уведомления"
        static let noticeViewControllerImage = UIImage(named: "notification")
        static let noticeViewControllerSelectedImage = UIImage(named: "noticeBlue")

        static let profileViewControllerTitle = "Профиль"
        static let profileViewControllerImage = UIImage(named: "person")
        static let profileViewControllerSelectedImage = UIImage(named: "personBlue")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
        setupTabBarViewControllers()
    }

    // MARK: - Private methods

    private func setupTabBarController() {
        view.backgroundColor = .white
        tabBar.isTranslucent = false
        tabBar.layer.borderColor = .appTabBarBorderColor()?.cgColor
        tabBar.layer.borderWidth = 1
    }

    private func setupTabBarViewControllers() {
        let feedViewController = UINavigationController(rootViewController: FeedViewController())
        feedViewController.tabBarItem = UITabBarItem(
            title: Constants.feedViewControllerTitle,
            image: Constants.feedViewControllerImage,
            selectedImage: Constants.feedViewControllerSelectedImage
        )

        let noticeViewController = UINavigationController(rootViewController: NotificationViewController())
        noticeViewController.tabBarItem = UITabBarItem(
            title: Constants.noticeViewControllerTitle,
            image: Constants.noticeViewControllerImage,
            selectedImage: Constants.noticeViewControllerSelectedImage
        )

        let profileViewController = UINavigationController(rootViewController: ProfileViewController())
        profileViewController.tabBarItem = UITabBarItem(
            title: Constants.profileViewControllerTitle,
            image: Constants.profileViewControllerImage,
            selectedImage: Constants.profileViewControllerSelectedImage
        )

        setViewControllers([feedViewController, noticeViewController, profileViewController], animated: true)
        selectedViewController = feedViewController
    }
}
