// NotificationButtonCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с уведомлениями и кнопкой
final class NotificationButtonCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let identifier = "NotificationButtonCell"
        static let subscribeText = "Подписаться"
        static let unscribeText = "Вы подписаны"
        static let verdanaBoldSize10 = UIFont(name: "Verdana-Bold", size: 10)
        static let verdanaSize12 = UIFont(name: "Verdana", size: 12)
    }

    // MARK: - Visual Components

    private let notificationLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.verdanaSize12
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let subscribeButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.subscribeText, for: .normal)
        button.titleLabel?.font = Constants.verdanaBoldSize10
        button.tintColor = .white
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let unscribeButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.unscribeText, for: .normal)
        button.titleLabel?.font = Constants.verdanaBoldSize10
        button.tintColor = .black
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var notificationLabelTwo: UILabel = {
        let label = UILabel()
        label.font = Constants.verdanaSize12
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let avatarImageViewTwo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupCell() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(notificationLabel)
        contentView.addSubview(subscribeButton)
        contentView.addSubview(avatarImageViewTwo)
        contentView.addSubview(notificationLabelTwo)
        contentView.addSubview(unscribeButton)
    }

    private func setupConstraints() {
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        avatarImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true

        notificationLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        notificationLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 7).isActive = true
        notificationLabel.widthAnchor.constraint(equalToConstant: 154).isActive = true
        notificationLabel.heightAnchor.constraint(equalToConstant: 55).isActive = true

        subscribeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13).isActive = true
        subscribeButton.leftAnchor.constraint(equalTo: notificationLabel.rightAnchor, constant: 8).isActive = true
        subscribeButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        subscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

        avatarImageViewTwo.topAnchor.constraint(equalTo: notificationLabel.bottomAnchor, constant: 140).isActive = true
        avatarImageViewTwo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        avatarImageViewTwo.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageViewTwo.heightAnchor.constraint(equalToConstant: 40).isActive = true

        notificationLabelTwo.topAnchor.constraint(equalTo: notificationLabel.bottomAnchor, constant: 140)
            .isActive = true
        notificationLabelTwo.leftAnchor.constraint(equalTo: avatarImageViewTwo.rightAnchor, constant: 7).isActive = true
        notificationLabelTwo.widthAnchor.constraint(equalToConstant: 154).isActive = true
        notificationLabelTwo.heightAnchor.constraint(equalToConstant: 55).isActive = true

        unscribeButton.topAnchor.constraint(equalTo: notificationLabel.bottomAnchor, constant: 140).isActive = true
        unscribeButton.leftAnchor.constraint(equalTo: notificationLabelTwo.rightAnchor, constant: 8).isActive = true
        unscribeButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        unscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    func configure(notification: Notification) {
        notificationLabel.text = notification.text
        avatarImageView.image = notification.avatar
        notificationLabelTwo.text = notification.text
        avatarImageViewTwo.image = notification.avatar
    }
}
