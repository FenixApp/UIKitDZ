// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран профиля
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let avatarImage = "mainPhoto"
        static let postCount = "66"
        static let subscribeCount = "453"
        static let subscriptCount = "234"
        static let nameProfile = "Мария Иванова"
        static let professionProfile = "Консультант"
        static let spaceImage = "space"
        static let rocketImage = "rocket"
        static let seaRocketImage = "seaRocket"
        static let earthImage = "earth"
        static let lockImage = UIImage(named: "lock")
        static let leftLabelText = "mary_rmLink"
        static let plusIconImage = UIImage(named: "plusIcon")
        static let configIconImage = UIImage(named: "configIcon")
        static let verdanaBoldSize14 = UIFont(name: "Verdana-Bold", size: 14)
        static let customViewRect = CGRect(x: 0, y: 0, width: 120, height: 44)
    }

    enum CountCells {
        case profile
        case profileStorys
        case profilePosts
    }

    // MARK: - Private Properties

    private let profileStorage = ProfileStorage()
    private let tableView = UITableView()
    private let range: [CountCells] = [.profile, .profileStorys, .profilePosts]

    private let lockIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.lockImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let leftCustomView: UIView = {
        let view = UIView()
        view.frame = Constants.customViewRect
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let leftLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.leftLabelText
        label.font = Constants.verdanaBoldSize14
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let rightCustomView: UIView = {
        let view = UIView()
        view.frame = Constants.customViewRect
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let plusIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.plusIconImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let configIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.configIconImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        setupNavigationBar()
        setupTableView()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        leftCustomView.addSubview(lockIconImageView)
        leftCustomView.addSubview(leftLabel)
        rightCustomView.addSubview(plusIconImageView)
        rightCustomView.addSubview(configIconImageView)
    }

    private func setupNavigationBar() {
        let leftCustomBarButtonItem = UIBarButtonItem(customView: leftCustomView)
        navigationItem.leftBarButtonItem = leftCustomBarButtonItem
        let rightCustomBarButtonItem = UIBarButtonItem(customView: rightCustomView)
        navigationItem.rightBarButtonItem = rightCustomBarButtonItem
    }

    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.Constants.identifier)
        tableView.register(ProfileStorysCell.self, forCellReuseIdentifier: ProfileStorysCell.Constants.identifier)
        tableView.register(ProfilePostsCell.self, forCellReuseIdentifier: ProfilePostsCell.Constants.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setupConstraints() {
        lockIconImageView.leadingAnchor.constraint(equalTo: leftCustomView.leadingAnchor).isActive = true
        lockIconImageView.centerYAnchor.constraint(equalTo: leftCustomView.centerYAnchor).isActive = true
        lockIconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        lockIconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true

        leftLabel.leadingAnchor.constraint(equalTo: lockIconImageView.trailingAnchor, constant: 4).isActive = true
        leftLabel.centerYAnchor.constraint(equalTo: leftCustomView.centerYAnchor).isActive = true

        plusIconImageView.trailingAnchor.constraint(equalTo: configIconImageView.leadingAnchor, constant: -4)
            .isActive = true
        plusIconImageView.centerYAnchor.constraint(equalTo: rightCustomView.centerYAnchor).isActive = true
        plusIconImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        plusIconImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true

        configIconImageView.trailingAnchor.constraint(equalTo: rightCustomView.trailingAnchor).isActive = true
        configIconImageView.centerYAnchor.constraint(equalTo: rightCustomView.centerYAnchor).isActive = true
        configIconImageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        configIconImageView.heightAnchor.constraint(equalToConstant: 10.5).isActive = true
    }
}

// MARK: - Extension ProfielViewController: UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells = range[indexPath.section]
        switch cells {
        case .profile:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ProfileCell.Constants.identifier,
                for: indexPath
            ) as? ProfileCell else {
                return UITableViewCell()
            }
            cell.configCell(info: ProfileInfo(
                avatarImage: Constants.avatarImage,
                postCount: Constants.postCount,
                subscribeCount: Constants.subscribeCount,
                subscriptCount: Constants.subscriptCount,
                nameProfile: Constants.nameProfile,
                professionProfile: Constants.professionProfile
            ))
            cell.linkButtonHandler = { [weak self] in
                let controllerToMove = WebViewController()
                self?.present(controllerToMove, animated: true)
            }
            return cell
        case .profileStorys:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ProfileStorysCell.Constants.identifier,
                for: indexPath
            ) as? ProfileStorysCell else { return UITableViewCell() }
            cell.configCell(story: profileStorage.story)
            return cell
        case .profilePosts:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ProfilePostsCell.Constants.identifier,
                for: indexPath
            ) as? ProfilePostsCell else {
                return UITableViewCell()
            }
            guard let firstImage = UIImage(named: Constants.earthImage),
                  let secondImage = UIImage(named: Constants.spaceImage),
                  let thirdImage = UIImage(named: Constants.rocketImage),
                  let fourthImage = UIImage(named: Constants.seaRocketImage)
            else {
                return cell
            }

            cell.setImages(images: [firstImage, secondImage, thirdImage, fourthImage])
            return cell
        }
    }
}

// MARK: - Extension UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellType = range[indexPath.section]
        switch cellType {
        case .profile:
            return 220
        case .profileStorys:
            return 90
        case .profilePosts:
            return 400
        }
    }
}
