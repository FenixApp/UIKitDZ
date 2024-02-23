// LinkTabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// MainTabBarController
class MainTabBarController: UITabBarController {

    // MARK: - Constants

    private enum Constants {
        static let feedVCTitle = "Лента"
        static let feedVCImage = UIImage(named: "feed")
        static let feedVCSelectedImage = UIImage(named: "house")

        static let noticeVCTitle = "Уведомления"
        static let noticeVCImage = UIImage(named: "notification")
        static let noticeVCSelectedImage = UIImage(named: "noticeBlue")

        static let profileVCTitle = "Профиль"
        static let profileVCImage = UIImage(named: "person")
        static let profileVCSelectedImage = UIImage(named: "personBlue")
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
        let feedVC = UINavigationController(rootViewController: MainPageViewController())
        feedVC.tabBarItem = UITabBarItem(
            title: Constants.feedVCTitle,
            image: Constants.feedVCImage,
            selectedImage: Constants.feedVCSelectedImage
        )

        let noticeVC = UINavigationController(rootViewController: NotificationViewController())
        noticeVC.tabBarItem = UITabBarItem(
            title: Constants.noticeVCTitle,
            image: Constants.noticeVCImage,
            selectedImage: Constants.noticeVCSelectedImage
        )

        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        profileVC.tabBarItem = UITabBarItem(
            title: Constants.profileVCTitle,
            image: Constants.profileVCImage,
            selectedImage: Constants.profileVCSelectedImage
        )

        setViewControllers([feedVC, noticeVC, profileVC], animated: true)
        selectedViewController = feedVC
    }
}
