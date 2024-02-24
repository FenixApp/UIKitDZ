// ProfileStorysCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с историями профиля
final class ProfileStorysCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let identifier = "ProfileStorysCell"
        static let verdanaBoldSize12 = UIFont(name: "Verdana-Bold", size: 12)
        static let verdanaBoldSize11 = UIFont(name: "Verdana-Bold", size: 11)
        static let verdanaBoldSize10 = UIFont(name: "Verdana-Bold", size: 10)
        static let verdanaSize12 = UIFont(name: "Verdana", size: 12)
        static let verdanaSize11 = UIFont(name: "Verdana", size: 11)
        static let verdanaSize10 = UIFont(name: "Verdana", size: 10)
    }

    // MARK: - Private Properties

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let firstStory: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let secondStory: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let thirdStory: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let fourthStory: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let fifthStory: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let sixthStory: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let seventhStory: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - public methods

    func configCell(story: [String]) {
        firstStory.image = UIImage(named: story[0])
        secondStory.image = UIImage(named: story[1])
        thirdStory.image = UIImage(named: story[2])
        fourthStory.image = UIImage(named: story[3])
        fifthStory.image = UIImage(named: story[0])
        sixthStory.image = UIImage(named: story[1])
        seventhStory.image = UIImage(named: story[2])
    }

    // MARK: - Private methods

    private func setupUI() {
        contentView.addSubview(scrollView)
        scrollView.addSubview(firstStory)
        scrollView.addSubview(secondStory)
        scrollView.addSubview(thirdStory)
        scrollView.addSubview(fourthStory)
        scrollView.addSubview(fifthStory)
        scrollView.addSubview(sixthStory)
        scrollView.addSubview(seventhStory)
    }

    private func setupConstraints() {
        setupScrollViewConstraints()
        setupFirstStoryConstraints()
        setupTwoStoryConstraints()
        setupTreeStoryConstraints()
        setupFourStoryConstraints()
        setupFiveStoryConstraints()
        setupSixStoryConstraints()
        setupSevenStoryConstraints()
    }

    private func setupScrollViewConstraints() {
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    private func setupFirstStoryConstraints() {
        firstStory.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        firstStory.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
        firstStory.widthAnchor.constraint(equalToConstant: 55).isActive = true
        firstStory.heightAnchor.constraint(equalToConstant: 71).isActive = true
    }

    private func setupTwoStoryConstraints() {
        secondStory.leadingAnchor.constraint(equalTo: firstStory.trailingAnchor, constant: 10)
            .isActive = true
        secondStory.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
        secondStory.widthAnchor.constraint(equalToConstant: 55).isActive = true
        secondStory.heightAnchor.constraint(equalToConstant: 71).isActive = true
    }

    private func setupTreeStoryConstraints() {
        thirdStory.leadingAnchor.constraint(equalTo: secondStory.leadingAnchor, constant: 62).isActive = true
        thirdStory.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
        thirdStory.widthAnchor.constraint(equalToConstant: 55).isActive = true
        thirdStory.heightAnchor.constraint(equalToConstant: 71).isActive = true
    }

    private func setupFourStoryConstraints() {
        fourthStory.leadingAnchor.constraint(equalTo: thirdStory.leadingAnchor, constant: 62).isActive = true
        fourthStory.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
        fourthStory.widthAnchor.constraint(equalToConstant: 55).isActive = true
        fourthStory.heightAnchor.constraint(equalToConstant: 71).isActive = true
    }

    private func setupFiveStoryConstraints() {
        fifthStory.leadingAnchor.constraint(equalTo: fourthStory.leadingAnchor, constant: 62).isActive = true
        fifthStory.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
        fifthStory.widthAnchor.constraint(equalToConstant: 55).isActive = true
        fifthStory.heightAnchor.constraint(equalToConstant: 71).isActive = true
    }

    private func setupSixStoryConstraints() {
        sixthStory.leadingAnchor.constraint(equalTo: fifthStory.leadingAnchor, constant: 62).isActive = true
        sixthStory.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
        sixthStory.widthAnchor.constraint(equalToConstant: 55).isActive = true
        sixthStory.heightAnchor.constraint(equalToConstant: 71).isActive = true
    }

    private func setupSevenStoryConstraints() {
        seventhStory.leadingAnchor.constraint(equalTo: sixthStory.leadingAnchor, constant: 62).isActive = true
        seventhStory.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true
        seventhStory.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
        seventhStory.widthAnchor.constraint(equalToConstant: 55).isActive = true
        seventhStory.heightAnchor.constraint(equalToConstant: 71).isActive = true
        seventhStory.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -7).isActive = true
    }
}
