// StorysCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с историями
final class StorysCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let identifier = "StorysCell"
        static let mainPhoto = "mainPhoto"
        static let mainTitle = "Ваша история"
        static let userPhoto = "userPhoto"
        static let userTitle = "lavanda123"
        static let verdanaSize10 = UIFont(name: "Verdana", size: 10)
    }

    // MARK: - Visual Components

    private let storysScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let coreView: UIView = {
        let coreView = UIView()
        coreView.translatesAutoresizingMaskIntoConstraints = false
        return coreView
    }()

    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.mainPhoto)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.mainTitle
        label.font = Constants.verdanaSize10
        label.textAlignment = .center
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let oneUserPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.userPhoto)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let oneUserTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.userTitle
        label.font = Constants.verdanaSize10
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let twoUserPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.userPhoto)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let twoUserTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.userTitle
        label.font = Constants.verdanaSize10
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let threeUserPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.userPhoto)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let threeUserTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.userTitle
        label.font = Constants.verdanaSize10
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let fourUserPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.userPhoto)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let fourUserTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.userTitle
        label.font = Constants.verdanaSize10
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let fiveUserPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.userPhoto)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let fiveUserTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.userTitle
        label.font = Constants.verdanaSize10
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        contentView.addSubview(storysScrollView)
        storysScrollView.addSubview(coreView)
        coreView.addSubview(mainImageView)
        coreView.addSubview(mainLabel)
        coreView.addSubview(oneUserPhotoImageView)
        coreView.addSubview(oneUserTitleLabel)
        coreView.addSubview(oneUserPhotoImageView)
        coreView.addSubview(oneUserTitleLabel)
        coreView.addSubview(twoUserTitleLabel)
        coreView.addSubview(twoUserPhotoImageView)
        coreView.addSubview(threeUserTitleLabel)
        coreView.addSubview(threeUserPhotoImageView)
        coreView.addSubview(fourUserTitleLabel)
        coreView.addSubview(fourUserPhotoImageView)
        coreView.addSubview(fiveUserTitleLabel)
        coreView.addSubview(fiveUserPhotoImageView)
    }

    private func setupConstraints() {
        storysScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        storysScrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        storysScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        storysScrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        coreView.leadingAnchor.constraint(equalTo: storysScrollView.leadingAnchor).isActive = true
        coreView.topAnchor.constraint(equalTo: storysScrollView.topAnchor).isActive = true
        coreView.trailingAnchor.constraint(equalTo: storysScrollView.trailingAnchor).isActive = true
        coreView.bottomAnchor.constraint(equalTo: storysScrollView.bottomAnchor).isActive = true
        coreView.heightAnchor.constraint(equalTo: storysScrollView.heightAnchor).isActive = true
        coreView.widthAnchor.constraint(equalTo: storysScrollView.widthAnchor, multiplier: 2.0).isActive = true

        mainImageView.leadingAnchor.constraint(equalTo: storysScrollView.leadingAnchor, constant: 12).isActive = true
        mainImageView.topAnchor.constraint(equalTo: storysScrollView.topAnchor, constant: 7).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true

        mainLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 5).isActive = true
        mainLabel.leadingAnchor.constraint(equalTo: storysScrollView.leadingAnchor, constant: 5).isActive = true
        mainLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        mainLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true

        oneUserPhotoImageView.topAnchor.constraint(equalTo: storysScrollView.topAnchor, constant: 7).isActive = true
        oneUserPhotoImageView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 22)
            .isActive = true
        oneUserPhotoImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        oneUserPhotoImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true

        oneUserTitleLabel.topAnchor.constraint(equalTo: oneUserPhotoImageView.bottomAnchor, constant: 5).isActive = true
        oneUserTitleLabel.leadingAnchor.constraint(equalTo: mainLabel.trailingAnchor, constant: 8).isActive = true
        oneUserTitleLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        oneUserTitleLabel.bottomAnchor.constraint(equalTo: storysScrollView.bottomAnchor, constant: -5).isActive = true

        oneUserPhotoImageView.topAnchor.constraint(equalTo: storysScrollView.topAnchor, constant: 7).isActive = true
        oneUserPhotoImageView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 22)
            .isActive = true
        oneUserPhotoImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        oneUserPhotoImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true

        oneUserTitleLabel.topAnchor.constraint(equalTo: oneUserPhotoImageView.bottomAnchor, constant: 5).isActive = true
        oneUserTitleLabel.leadingAnchor.constraint(equalTo: mainLabel.trailingAnchor, constant: 8).isActive = true
        oneUserTitleLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        oneUserTitleLabel.bottomAnchor.constraint(equalTo: storysScrollView.bottomAnchor, constant: -5).isActive = true

        twoUserTitleLabel.topAnchor.constraint(equalTo: oneUserPhotoImageView.bottomAnchor, constant: 5).isActive = true
        twoUserTitleLabel.leadingAnchor.constraint(equalTo: oneUserTitleLabel.trailingAnchor, constant: 8)
            .isActive = true
        twoUserTitleLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        twoUserTitleLabel.bottomAnchor.constraint(equalTo: storysScrollView.bottomAnchor, constant: -5).isActive = true

        twoUserPhotoImageView.topAnchor.constraint(equalTo: storysScrollView.topAnchor, constant: 7).isActive = true
        twoUserPhotoImageView.leadingAnchor.constraint(equalTo: oneUserPhotoImageView.trailingAnchor, constant: 22)
            .isActive = true
        twoUserPhotoImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        twoUserPhotoImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true

        threeUserTitleLabel.topAnchor.constraint(equalTo: twoUserPhotoImageView.bottomAnchor, constant: 5)
            .isActive = true
        threeUserTitleLabel.leadingAnchor.constraint(equalTo: twoUserTitleLabel.trailingAnchor, constant: 8)
            .isActive = true
        threeUserTitleLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        threeUserTitleLabel.bottomAnchor.constraint(equalTo: storysScrollView.bottomAnchor, constant: -5)
            .isActive = true

        threeUserPhotoImageView.topAnchor.constraint(equalTo: storysScrollView.topAnchor, constant: 7).isActive = true
        threeUserPhotoImageView.leadingAnchor.constraint(equalTo: twoUserPhotoImageView.trailingAnchor, constant: 22)
            .isActive = true
        threeUserPhotoImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        threeUserPhotoImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true

        fourUserTitleLabel.topAnchor.constraint(equalTo: threeUserPhotoImageView.bottomAnchor, constant: 5)
            .isActive = true
        fourUserTitleLabel.leadingAnchor.constraint(equalTo: threeUserTitleLabel.trailingAnchor, constant: 8)
            .isActive = true
        fourUserTitleLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        fourUserTitleLabel.bottomAnchor.constraint(equalTo: storysScrollView.bottomAnchor, constant: -5).isActive = true

        fourUserPhotoImageView.topAnchor.constraint(equalTo: storysScrollView.topAnchor, constant: 7).isActive = true
        fourUserPhotoImageView.leadingAnchor.constraint(equalTo: threeUserPhotoImageView.trailingAnchor, constant: 22)
            .isActive = true
        fourUserPhotoImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        fourUserPhotoImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true

        fiveUserTitleLabel.topAnchor.constraint(equalTo: fourUserPhotoImageView.bottomAnchor, constant: 5)
            .isActive = true
        fiveUserTitleLabel.leadingAnchor.constraint(equalTo: fourUserTitleLabel.trailingAnchor, constant: 8)
            .isActive = true
        fiveUserTitleLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        fiveUserTitleLabel.bottomAnchor.constraint(equalTo: storysScrollView.bottomAnchor, constant: -5).isActive = true

        fiveUserPhotoImageView.topAnchor.constraint(equalTo: storysScrollView.topAnchor, constant: 7).isActive = true
        fiveUserPhotoImageView.leadingAnchor.constraint(equalTo: fourUserPhotoImageView.trailingAnchor, constant: 22)
            .isActive = true
        fiveUserPhotoImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        fiveUserPhotoImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
