// RecommendCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с рекомендуемыми аккаунтами
final class RecommendCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let identifier = "RecommendCell"
        static let recommendText = "Рекомендуем вам"
        static let allRecommendText = "Все"
        static let subscribeText = "Подписаться"
        static let userTitle = "crimea_082"
        static let secondUserTitle = "mary_pol"
        static let recommendOnePhoto = "crimea"
        static let recommendTwoPhoto = "mary"
        static let closeButton = "close"
        static let verdanaBoldSize10 = UIFont(name: "Verdana-Bold", size: 10)
        static let verdanaSize10 = UIFont(name: "Verdana", size: 10)
    }

    // MARK: - Visual Components

    private let recommendLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.recommendText
        label.font = Constants.verdanaBoldSize10
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let allRecommendLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.allRecommendText
        label.font = Constants.verdanaBoldSize10
        label.textAlignment = .right
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private let closeFirstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.closeButton)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let firstUserPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.recommendOnePhoto)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let firstUserTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.userTitle
        label.font = Constants.verdanaSize10
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let firstSubscribeButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.subscribeText, for: .normal)
        button.titleLabel?.font = Constants.verdanaBoldSize10
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let secondView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private let closeSecondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.closeButton)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let secondUserPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.recommendTwoPhoto)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let secondUserTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.secondUserTitle
        label.font = Constants.verdanaSize10
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let secondSubscribeButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.subscribeText, for: .normal)
        button.titleLabel?.font = Constants.verdanaBoldSize10
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let recommendScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    private let coreView: UIView = {
        let coreView = UIView()
        coreView.translatesAutoresizingMaskIntoConstraints = false
        return coreView
    }()

    // MARK: - Life Cycle

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
        contentView.backgroundColor = .recommendColor()
        contentView.addSubview(recommendScrollView)
        recommendScrollView.addSubview(coreView)
        coreView.addSubview(recommendLabel)
        coreView.addSubview(allRecommendLabel)
        coreView.addSubview(firstView)
        firstView.addSubview(closeFirstImageView)
        firstView.addSubview(firstUserPhotoImageView)
        firstView.addSubview(firstUserTitleLabel)
        firstView.addSubview(firstSubscribeButton)
        coreView.addSubview(secondView)
        secondView.addSubview(closeSecondImageView)
        secondView.addSubview(secondUserTitleLabel)
        secondView.addSubview(secondUserPhotoImageView)
        secondView.addSubview(secondSubscribeButton)
    }

    private func setupConstraints() {
        recommendScrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        recommendScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        recommendScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        recommendScrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        coreView.leadingAnchor.constraint(equalTo: recommendScrollView.leadingAnchor).isActive = true
        coreView.trailingAnchor.constraint(equalTo: recommendScrollView.trailingAnchor).isActive = true
        coreView.topAnchor.constraint(equalTo: recommendScrollView.topAnchor).isActive = true
        coreView.bottomAnchor.constraint(equalTo: recommendScrollView.bottomAnchor).isActive = true
        coreView.heightAnchor.constraint(equalTo: recommendScrollView.heightAnchor).isActive = true
        coreView.widthAnchor.constraint(equalTo: recommendScrollView.widthAnchor, multiplier: 1.3).isActive = true

        recommendLabel.topAnchor.constraint(equalTo: recommendScrollView.topAnchor, constant: 9).isActive = true
        recommendLabel.leftAnchor.constraint(equalTo: recommendScrollView.leftAnchor, constant: 12).isActive = true
        recommendLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        recommendLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true

        allRecommendLabel.topAnchor.constraint(equalTo: recommendScrollView.topAnchor, constant: 9).isActive = true
        allRecommendLabel.leftAnchor.constraint(equalTo: recommendScrollView.leftAnchor, constant: 258).isActive = true
        allRecommendLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        allRecommendLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true

        firstView.topAnchor.constraint(equalTo: recommendLabel.bottomAnchor, constant: 21).isActive = true
        firstView.leftAnchor.constraint(equalTo: recommendScrollView.leftAnchor, constant: 17).isActive = true
        firstView.widthAnchor.constraint(equalToConstant: 185).isActive = true
        firstView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        firstView.bottomAnchor.constraint(equalTo: recommendScrollView.bottomAnchor, constant: -25).isActive = true

        closeFirstImageView.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 7).isActive = true
        closeFirstImageView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -7).isActive = true
        closeFirstImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        closeFirstImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true

        firstUserPhotoImageView.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 15).isActive = true
        firstUserPhotoImageView.leftAnchor.constraint(equalTo: firstView.leftAnchor, constant: 35).isActive = true
        firstUserPhotoImageView.widthAnchor.constraint(equalToConstant: 115).isActive = true
        firstUserPhotoImageView.heightAnchor.constraint(equalToConstant: 115).isActive = true

        firstUserTitleLabel.topAnchor.constraint(equalTo: firstUserPhotoImageView.bottomAnchor, constant: 5)
            .isActive = true
        firstUserTitleLabel.leftAnchor.constraint(equalTo: firstView.leftAnchor, constant: 42).isActive = true
        firstUserTitleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        firstUserTitleLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true

        firstSubscribeButton.topAnchor.constraint(equalTo: firstUserTitleLabel.bottomAnchor, constant: 9)
            .isActive = true
        firstSubscribeButton.leftAnchor.constraint(equalTo: firstView.leftAnchor, constant: 10).isActive = true
        firstSubscribeButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        firstSubscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

        secondView.topAnchor.constraint(equalTo: recommendLabel.bottomAnchor, constant: 21).isActive = true
        secondView.leftAnchor.constraint(equalTo: firstView.rightAnchor, constant: 20).isActive = true
        secondView.widthAnchor.constraint(equalToConstant: 185).isActive = true
        secondView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        secondView.bottomAnchor.constraint(equalTo: recommendScrollView.bottomAnchor, constant: -25).isActive = true

        closeSecondImageView.topAnchor.constraint(equalTo: secondView.topAnchor, constant: 5).isActive = true
        closeSecondImageView.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -5).isActive = true
        closeSecondImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        closeSecondImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true

        secondUserPhotoImageView.topAnchor.constraint(equalTo: secondView.topAnchor, constant: 15).isActive = true
        secondUserPhotoImageView.leftAnchor.constraint(equalTo: secondView.leftAnchor, constant: 35).isActive = true
        secondUserPhotoImageView.widthAnchor.constraint(equalToConstant: 115).isActive = true
        secondUserPhotoImageView.heightAnchor.constraint(equalToConstant: 115).isActive = true

        secondUserTitleLabel.topAnchor.constraint(equalTo: secondUserPhotoImageView.bottomAnchor, constant: 5)
            .isActive = true
        secondUserTitleLabel.leftAnchor.constraint(equalTo: secondView.leftAnchor, constant: 42).isActive = true
        secondUserTitleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        secondUserTitleLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true

        secondSubscribeButton.topAnchor.constraint(equalTo: secondUserTitleLabel.bottomAnchor, constant: 9)
            .isActive = true
        secondSubscribeButton.leftAnchor.constraint(equalTo: secondView.leftAnchor, constant: 10).isActive = true
        secondSubscribeButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        secondSubscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
