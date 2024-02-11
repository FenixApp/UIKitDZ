// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Настройка экрана при старте приложения
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let loginVC = LoginViewController()
        let navigationVC = UINavigationController()
        let listVC = ListViewController()

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationVC
        navigationVC.pushViewController(listVC, animated: true)
        window.makeKeyAndVisible()
        self.window = window
        window.backgroundColor = .white
    }
}
