// ThirdViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class с краном выставленного чека
class ThirdViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var resultButton: UIButton!

    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        resultButton.layer.cornerRadius = 10
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Чек"
    }
}
