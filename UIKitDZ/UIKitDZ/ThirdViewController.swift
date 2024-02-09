// ThirdViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Экран с высставленным чеком
class ThirdViewController: UIViewController {
    @IBOutlet var resultButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        resultButton.layer.cornerRadius = 10
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Чек"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }
}
