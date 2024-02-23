// NotificationPictureCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с уведомлениями
final class NotificationPictureCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let identifier = "NotificationPictureCell"
        static let verdanaSize12 = UIFont(name: "Verdana", size: 12)
    }

    // MARK: - Visual Components

    private let notificationLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.verdanaSize12
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let pictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupCell() {
        contentView.addSubview(avatarImageView)
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        avatarImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true

        contentView.addSubview(notificationLabel)
        notificationLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        notificationLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 7).isActive = true
        notificationLabel.widthAnchor.constraint(equalToConstant: 240).isActive = true
        notificationLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true

        contentView.addSubview(pictureImageView)
        pictureImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        pictureImageView.leftAnchor.constraint(equalTo: notificationLabel.rightAnchor, constant: 24).isActive = true
        pictureImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        pictureImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    func configure(notification: Notification) {
        notificationLabel.text = notification.text
        avatarImageView.image = notification.avatar
        pictureImageView.image = notification.picture
    }
}
