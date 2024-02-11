// ListViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран со списком людей и напоминанием об их Дне Рождения
class ListViewController: UIViewController {
    private let helenaImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Helena")
        imageView.frame = CGRect(x: 20, y: 120, width: 75, height: 75)
        return imageView
    }()

    private let helenaLabel: UILabel = {
        let label = UILabel()
        label.text = "Helena Link"
        label.frame = CGRect(x: 100, y: 135, width: 209, height: 20)
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    private let helenaDateLabel: UILabel = {
        let label = UILabel()
        label.text = "10.03 - turns 251"
        label.frame = CGRect(x: 100, y: 160, width: 209, height: 20)
        label.font = UIFont(name: "Verdana", size: 14)
        return label
    }()

    private let helenaDaysImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Cake")
        imageView.frame = CGRect(x: 330, y: 135, width: 44, height: 44)
        return imageView
    }()

    private let veronaImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Verona")
        imageView.frame = CGRect(x: 20, y: 210, width: 75, height: 75)
        return imageView
    }()

    private let veronaLabel: UILabel = {
        let label = UILabel()
        label.text = "Verona Tusk"
        label.frame = CGRect(x: 100, y: 225, width: 209, height: 20)
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    private let veronaDateLabel: UILabel = {
        let label = UILabel()
        label.text = "20.03 - turns 39"
        label.frame = CGRect(x: 100, y: 250, width: 209, height: 20)
        label.font = UIFont(name: "Verdana", size: 14)
        return label
    }()

    private let veronaDaysLabel: UILabel = {
        let label = UILabel()
        label.text = "10\ndays"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.frame = CGRect(x: 330, y: 225, width: 42, height: 42)
        label.textColor = UIColor(red: 90 / 255, green: 67 / 255, blue: 148 / 255, alpha: 1)
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    private let alexImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Alex")
        imageView.frame = CGRect(x: 20, y: 305, width: 75, height: 75)
        return imageView
    }()

    private let alexLabel: UILabel = {
        let label = UILabel()
        label.text = "Alex Smith"
        label.frame = CGRect(x: 100, y: 315, width: 209, height: 20)
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    private let alexDateLabel: UILabel = {
        let label = UILabel()
        label.text = "21.04 - turns 51"
        label.frame = CGRect(x: 100, y: 340, width: 209, height: 20)
        label.font = UIFont(name: "Verdana", size: 14)
        return label
    }()

    private let alexDaysLabel: UILabel = {
        let label = UILabel()
        label.text = "42\ndays"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.frame = CGRect(x: 330, y: 315, width: 42, height: 42)
        label.textColor = UIColor(red: 90 / 255, green: 67 / 255, blue: 148 / 255, alpha: 1)
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    private let tomImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Tom")
        imageView.frame = CGRect(x: 20, y: 400, width: 75, height: 75)
        return imageView
    }()

    private let tomLabel: UILabel = {
        let label = UILabel()
        label.text = "Tom Johnson"
        label.frame = CGRect(x: 100, y: 410, width: 209, height: 20)
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    private let tomDateLabel: UILabel = {
        let label = UILabel()
        label.text = "05.06 - turns 18"
        label.frame = CGRect(x: 100, y: 435, width: 209, height: 20)
        label.font = UIFont(name: "Verdana", size: 14)
        return label
    }()

    private let tomDaysLabel: UILabel = {
        let label = UILabel()
        label.text = "87\ndays"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.frame = CGRect(x: 330, y: 410, width: 42, height: 42)
        label.textColor = UIColor(red: 90 / 255, green: 67 / 255, blue: 148 / 255, alpha: 1)
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        navigationItem.title = "Birthday Reminder"
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "Plus"), style: .done, target:
//        self, action: #selector(addSettings))
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addSettings))
        navigationItem.rightBarButtonItem = addBarButton

        setElements()
    }

    private func setElements() {
        view.addSubview(helenaImage)
        view.addSubview(helenaLabel)
        view.addSubview(helenaDateLabel)
        view.addSubview(helenaDaysImage)
        view.addSubview(veronaImage)
        view.addSubview(veronaLabel)
        view.addSubview(veronaDateLabel)
        view.addSubview(veronaDaysLabel)
        view.addSubview(alexImage)
        view.addSubview(alexLabel)
        view.addSubview(alexDateLabel)
        view.addSubview(alexDaysLabel)
        view.addSubview(tomImage)
        view.addSubview(tomLabel)
        view.addSubview(tomDateLabel)
        view.addSubview(tomDaysLabel)
    }

    @objc func addSettings() {
        print("Click")
    }
}
