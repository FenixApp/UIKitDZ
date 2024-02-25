// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран со светофором на storyboard
final class ViewController: UIViewController {
    @IBOutlet var redView: UIView!
    @IBOutlet var greenView: UIView!
    @IBOutlet var yellowView: UIView!

    override func viewWillLayoutSubviews() {
//        setCircles()
    }

    private func setCircles() {
        let isLandscape = view.bounds.size.width > view.bounds.size.height
        let heightYellowView = isLandscape ? view.bounds.size.width * 0.11 : view.bounds.size.height * 0.14
        redView.layer.cornerRadius = heightYellowView / 2
        yellowView.layer.cornerRadius = heightYellowView / 2
        greenView.layer.cornerRadius = heightYellowView / 2
    }
}
