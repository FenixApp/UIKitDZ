// NotificationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с уведомлениями
final class NotificationViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let notificationText = "Уведомления"
        static let requestText = "Запросы на подписку"
        static let firstAvatarImage = UIImage(named: "userPhoto")
        static let firstPictureImage = UIImage(named: "naturePicture")
        static let firstText = "lavanda123 понравился ваш комментарий: \"Очень красиво!\" 12ч"
        static let verdanaBoldSize22 = UIFont(name: "Verdana-Bold", size: 22)
        static let verdanaBoldSize14 = UIFont(name: "Verdana-Bold", size: 14)
        static let verdanaSize14 = UIFont(name: "Verdana", size: 14)
    }

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private let notificationLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.notificationText
        label.font = Constants.verdanaBoldSize22
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let requestLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.requestText
        label.font = Constants.verdanaSize14
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Private Properties

    private var notifications: [Notification] = []

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupUI()
    }

    // MARK: - Private Methods

    func setupUI() {
        let firstAvatarImage = Constants.firstAvatarImage
        let firstPictureImage = Constants.firstPictureImage

        if let firstAvatar = firstAvatarImage, let firstPicture = firstPictureImage {
            let firstNotification = Notification(
                text: Constants.firstText, avatar: firstAvatar, picture: firstPicture
            )
            notifications.append(firstNotification)
            notifications.append(firstNotification)
            notifications.append(firstNotification)
            notifications.append(firstNotification)
            notifications.append(firstNotification)
            notifications.append(firstNotification)
            notifications.append(firstNotification)
            notifications.append(firstNotification)
            notifications.append(firstNotification)
        }

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            NotificationPictureCell.self,
            forCellReuseIdentifier: NotificationPictureCell.Constants.identifier
        )
        tableView.register(
            NotificationButtonCell.self,
            forCellReuseIdentifier: NotificationButtonCell.Constants.identifier
        )
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
    }

    func setupTableView() {
        view.backgroundColor = .white
        view.addSubview(notificationLabel)
        notificationLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 57).isActive = true
        notificationLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        notificationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        notificationLabel.widthAnchor.constraint(equalToConstant: 194).isActive = true

        view.addSubview(requestLabel)
        requestLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        requestLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        requestLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        requestLabel.widthAnchor.constraint(equalToConstant: 251).isActive = true

        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: requestLabel.bottomAnchor, constant: 21).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: 351).isActive = true
    }
}

extension NotificationViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return min(2, notifications.count)
        } else if section == 1 {
            return max(0, notifications.count - 2)
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        _ = min(2, notifications.count)

        if indexPath.row == 3 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "NotificationButtonCell", for: indexPath
            ) as? NotificationButtonCell
            else { fatalError() }

            cell.configure(notification: notifications[indexPath.row])
            return cell

        } else if indexPath.row == 5 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "NotificationButtonCell", for: indexPath
            ) as? NotificationButtonCell
            else { fatalError() }

            cell.configure(notification: notifications[indexPath.row])

            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "NotificationPictureCell", for: indexPath
            ) as? NotificationPictureCell
            else { fatalError() }

            cell.configure(notification: notifications[indexPath.row])
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}

extension NotificationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        headerView.backgroundColor = .white

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        if section == 0 {
            label.text = "Сегодня"
        } else if section == 1 {
            label.text = "На этой неделе"
        }
        label.font = Constants.verdanaBoldSize14
        label.textColor = .black
        headerView.addSubview(label)

        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
}
