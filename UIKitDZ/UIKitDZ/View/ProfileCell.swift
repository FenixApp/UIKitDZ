// ProfileCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка профиля
final class ProfileCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let identifier = "ProfileCell"
        static let verdanaBoldSize12 = UIFont(name: "Verdana-Bold", size: 12)
        static let verdanaBoldSize11 = UIFont(name: "Verdana-Bold", size: 11)
        static let verdanaBoldSize10 = UIFont(name: "Verdana-Bold", size: 10)
        static let verdanaSize12 = UIFont(name: "Verdana", size: 12)
        static let verdanaSize11 = UIFont(name: "Verdana", size: 11)
        static let verdanaSize10 = UIFont(name: "Verdana", size: 10)
        static let postLabelText = "публикации"
        static let subscribeLabelText = "подписчики"
        static let subscriptLabelText = "подписки"
        static let changeProfileLabelText = "Изменить"
        static let shareProfileLabelText = "Поделиться профилем"
        static let plusPersonIcon = "plusPersonIcon"
        static let buttonWebSiteText = "📎 www.spacex.com"
    }

    // MARK: - Private properties

    private let postCountLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.verdanaBoldSize12
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let postLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.verdanaSize11
        label.textAlignment = .left
        label.text = Constants.postLabelText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let subscribeCountLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.verdanaBoldSize12
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let subscribeLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.verdanaSize11
        label.textAlignment = .left
        label.text = Constants.subscribeLabelText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let subscriptCountLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.verdanaBoldSize12
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let subscriptLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.verdanaSize11
        label.textAlignment = .left
        label.text = Constants.subscriptLabelText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let nameProfileLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.verdanaBoldSize11
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let professionLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.verdanaSize11
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let changeProfileLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.verdanaBoldSize10
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.text = Constants.changeProfileLabelText
        label.backgroundColor = .profileColor()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let shareProfileLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.verdanaBoldSize10
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.backgroundColor = .profileColor()
        label.text = Constants.shareProfileLabelText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let iconView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.backgroundColor = .profileColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Constants.plusPersonIcon)
        return imageView
    }()

    private lazy var buttonWebSite: UIButton = {
        let webSite = UIButton()
        webSite.setTitle(Constants.buttonWebSiteText, for: .normal)
        webSite.titleLabel?.font = Constants.verdanaSize12
        webSite.setTitleColor(.blue, for: .normal)
        webSite.titleLabel?.textAlignment = .left
        webSite.translatesAutoresizingMaskIntoConstraints = false
        webSite.addTarget(self, action: #selector(openLink), for: .touchUpInside)
        return webSite
    }()

    // MARK: - Public Properties

    var linkButtonHandler: (() -> ())?

    // MARK: - Life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupIU()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configCell(info: ProfileInfo) {
        avatarImageView.image = UIImage(named: info.avatarImage)
        postCountLabel.text = info.postCount
        subscribeCountLabel.text = info.subscribeCount
        subscriptCountLabel.text = info.subscriptCount
        nameProfileLabel.text = info.nameProfile
        professionLabel.text = info.professionProfile
    }

    // MARK: - Private Methods

    private func setupIU() {
        contentView.backgroundColor = .white
        contentView.addSubview(avatarImageView)
        contentView.addSubview(postCountLabel)
        contentView.addSubview(postLabel)
        contentView.addSubview(subscribeCountLabel)
        contentView.addSubview(subscribeLabel)
        contentView.addSubview(subscriptCountLabel)
        contentView.addSubview(subscriptLabel)
        contentView.addSubview(nameProfileLabel)
        contentView.addSubview(professionLabel)
        contentView.addSubview(changeProfileLabel)
        contentView.addSubview(shareProfileLabel)
        contentView.addSubview(iconView)
        contentView.addSubview(iconImageView)
        contentView.addSubview(buttonWebSite)
    }

    private func setupConstraints() {
        setupAvatarImageViewConstraints()
        setupPostCountLabelConstraints()
        setupPostLabelConstraints()
        setupSubscribeCountLabelConstraints()
        setupSubscribeLabelConstraints()
        setupSubscriptCountLabelConstraints()
        setupSubscriptLabelConstraints()
        setupNameProfileLabelConstraints()
        setupProfessionLabelConstraints()
        setupChangeLabelConstraints()
        setupShareProfileLabelConstraints()
        setupIconViewConstraints()
        setupButtonWebSiteConstraints()
        setupIconImageViewConstraints()
    }

    @objc private func openLink() {
        linkButtonHandler?()
    }

    private func setupAvatarImageViewConstraints() {
        avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func setupPostCountLabelConstraints() {
        postCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 155).isActive = true
        postCountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        postCountLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        postCountLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func setupPostLabelConstraints() {
        postLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 130).isActive = true
        postLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        postLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        postLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func setupSubscribeCountLabelConstraints() {
        subscribeCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 225)
            .isActive = true
        subscribeCountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        subscribeCountLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        subscribeCountLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func setupSubscribeLabelConstraints() {
        subscribeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 208).isActive = true
        subscribeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        subscribeLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        subscribeLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func setupSubscriptCountLabelConstraints() {
        subscriptCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 291)
            .isActive = true
        subscriptCountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        subscriptCountLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        subscriptCountLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func setupSubscriptLabelConstraints() {
        subscriptLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 282).isActive = true
        subscriptLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        subscriptLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        subscriptLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func setupNameProfileLabelConstraints() {
        nameProfileLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        nameProfileLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 95).isActive = true
        nameProfileLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        nameProfileLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func setupProfessionLabelConstraints() {
        professionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        professionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 115).isActive = true
        professionLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        professionLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func setupChangeLabelConstraints() {
        changeProfileLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        changeProfileLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 187).isActive = true
        changeProfileLabel.widthAnchor.constraint(equalToConstant: 155).isActive = true
        changeProfileLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }

    private func setupShareProfileLabelConstraints() {
        shareProfileLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 175).isActive = true
        shareProfileLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 187).isActive = true
        shareProfileLabel.widthAnchor.constraint(equalToConstant: 155).isActive = true
        shareProfileLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }

    private func setupIconViewConstraints() {
        iconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 340).isActive = true
        iconView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 186).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 28).isActive = true
    }

    private func setupIconImageViewConstraints() {
        iconImageView.centerXAnchor.constraint(equalTo: iconView.centerXAnchor).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: iconView.centerYAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 10.67).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func setupButtonWebSiteConstraints() {
        buttonWebSite.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        buttonWebSite.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 140).isActive = true
        buttonWebSite.widthAnchor.constraint(equalToConstant: 150).isActive = true
        buttonWebSite.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
