// PostsCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с постами
final class PostsCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let identifier = "PostCell"
        static let turPhoto = "turPhoto"
        static let turTitle = "tur_v_dagestan"
        static let dottedImage = "dottedButton"
        static let heartImage = "heart"
        static let messageImage = "comment"
        static let airPlaneImage = "export"
        static let saveImage = "save"
        static let likesText = "Нравится: 201"
        static let descriptionText = "Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!"
        static let smallAvatar = "smallAvatar"
        static let commentText = "Комментировать..."
        static let tenMinTextLabel = "10 минут назад"
        static let verdanaBoldSize12 = UIFont(name: "Verdana-Bold", size: 12)
        static let verdanaBoldSize10 = UIFont(name: "Verdana-Bold", size: 10)
        static let verdanaSize10 = UIFont(name: "Verdana", size: 10)
        static let naturePicture = "naturePicture"
    }

    // MARK: - Visual Components

    /// аватар поста
    private let avatarPostPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.turPhoto)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    /// название поста
    private let titlePostLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.turTitle
        label.font = Constants.verdanaBoldSize12
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    /// Кнопка
    private let dottedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.dottedImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    /// сердце клик
    private let heartImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.heartImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    /// комментарий клик
    private let messageImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.messageImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    /// телеграмм клик
    private let airPlaneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.airPlaneImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    /// сохранить клик
    private let saveImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.saveImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    /// нравится 201
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.likesText
        label.font = Constants.verdanaBoldSize10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    /// Насладитесь красотой природы
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.descriptionText
        label.font = Constants.verdanaSize10
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    /// аватар комментировать
    private let smallAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.smallAvatar)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    /// комментировать
    private let commentLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.commentText
        label.font = Constants.verdanaBoldSize10
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    /// 10 минут назад
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.tenMinTextLabel
        label.font = Constants.verdanaBoldSize10
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let imagePageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .lightGray
        return pageControl
    }()

    private let imageScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    private let pictureImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
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
        contentView.addSubview(avatarPostPhotoImageView)
        contentView.addSubview(titlePostLabel)
        contentView.addSubview(imageScrollView)
        contentView.addSubview(heartImageView)
        contentView.addSubview(dottedImageView)
        contentView.addSubview(messageImageView)
        contentView.addSubview(airPlaneImageView)
        contentView.addSubview(saveImageView)
        contentView.addSubview(likesLabel)
        contentView.addSubview(smallAvatarImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(commentLabel)
        contentView.addSubview(timeLabel)
    }

    private func setupConstraints() {
        avatarPostPhotoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        avatarPostPhotoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12)
            .isActive = true
        avatarPostPhotoImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        avatarPostPhotoImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true

        titlePostLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        titlePostLabel.leadingAnchor.constraint(equalTo: avatarPostPhotoImageView.trailingAnchor, constant: 6)
            .isActive = true
        titlePostLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        titlePostLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        dottedImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35).isActive = true
        dottedImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        dottedImageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        dottedImageView.heightAnchor.constraint(equalToConstant: 2).isActive = true

        imageScrollView.topAnchor.constraint(equalTo: titlePostLabel.bottomAnchor, constant: 10).isActive = true
        imageScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageScrollView.widthAnchor.constraint(equalToConstant: 375).isActive = true
        imageScrollView.heightAnchor.constraint(equalToConstant: 237).isActive = true

        contentView.addSubview(pictureImageView)
        pictureImageView.topAnchor.constraint(equalTo: titlePostLabel.bottomAnchor, constant: 10)
            .isActive = true
        pictureImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        pictureImageView.widthAnchor.constraint(equalToConstant: 375).isActive = true
        pictureImageView.heightAnchor.constraint(equalToConstant: 237).isActive = true
        imagePageControl.translatesAutoresizingMaskIntoConstraints = false

        imagePageControl.widthAnchor.constraint(equalToConstant: 375).isActive = true
        imagePageControl.heightAnchor.constraint(equalToConstant: 37).isActive = true

        heartImageView.topAnchor.constraint(equalTo: imageScrollView.bottomAnchor, constant: 8).isActive = true
        heartImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        heartImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        heartImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true

        messageImageView.topAnchor.constraint(equalTo: imageScrollView.bottomAnchor, constant: 8).isActive = true
        messageImageView.leadingAnchor.constraint(equalTo: heartImageView.trailingAnchor, constant: 8).isActive = true
        messageImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        messageImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true

        airPlaneImageView.topAnchor.constraint(equalTo: imageScrollView.bottomAnchor, constant: 10).isActive = true
        airPlaneImageView.leadingAnchor.constraint(equalTo: messageImageView.trailingAnchor, constant: 8)
            .isActive = true
        airPlaneImageView.widthAnchor.constraint(equalToConstant: 19).isActive = true
        airPlaneImageView.heightAnchor.constraint(equalToConstant: 19).isActive = true

        saveImageView.topAnchor.constraint(equalTo: imageScrollView.bottomAnchor, constant: 8).isActive = true
        saveImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -9).isActive = true
        saveImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        saveImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true

        likesLabel.topAnchor.constraint(equalTo: heartImageView.bottomAnchor, constant: 6).isActive = true
        likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        likesLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        likesLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true

        descriptionLabel.topAnchor.constraint(equalTo: likesLabel.bottomAnchor, constant: 6).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: 361).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        smallAvatarImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4).isActive = true
        smallAvatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        smallAvatarImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        smallAvatarImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true

        commentLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 6).isActive = true
        commentLabel.leadingAnchor.constraint(equalTo: smallAvatarImageView.trailingAnchor, constant: 3).isActive = true
        commentLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        commentLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true

        timeLabel.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 7).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 361).isActive = true
        timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
    }
}
