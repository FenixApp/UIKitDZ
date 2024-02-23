// FeedViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Главный экран приложения с лентой новостей
final class FeedViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let turPhoto = "turPhoto"
        static let naturePicture = "naturePicture"
        static let naturePictureTwo = "naturePictureTwo"
        static let tenMinTextLabel = "10 минут назад"
        static let turTitle = "tur_v_dagestan"
    }

    // MARK: - Private Properties

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private var posts: [Post] = []

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupConstraints()
        setupTabBar()
        setupGalery()
    }

    // MARK: - Public Methods

    func setupTabBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "RMLink"),
            style: .plain,
            target: self,
            action: nil
        )
        navigationItem.leftBarButtonItem?.tintColor = .black

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "message"),
            style: .plain,
            target: self,
            action: nil
        )
        navigationItem.rightBarButtonItem?.tintColor = .black
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(StorysCell.self, forCellReuseIdentifier: StorysCell.Constants.identifier)
        tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.Constants.identifier)
        tableView.register(RecommendCell.self, forCellReuseIdentifier: RecommendCell.Constants.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
    }

    // MARK: - Private Methods

    private func setupGalery() {
        let turPhotoImage = UIImage(named: Constants.turPhoto)
        let turPictureImage = UIImage(named: Constants.naturePicture)
        let turPictureImageTwo = UIImage(named: Constants.naturePictureTwo)

        if let turPhoto = turPhotoImage, let turPicture = turPictureImage, let turPictureTwo = turPictureImageTwo {
            let firstPostImages = [turPicture, turPictureTwo, turPicture]
            let post1 = Post(
                nickName: Constants.turTitle,
                photoImage: turPhoto,
                picturesImage: firstPostImages,
                timeText: Constants.tenMinTextLabel
            )
            posts.append(post1)
            posts.append(post1)
            posts.append(post1)
            posts.append(post1)
            posts.append(post1)
        }
    }

    private func setupConstraints() {
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: 375).isActive = true
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: StorysCell.Constants.identifier,
                for: indexPath
            ) as? StorysCell
            else { return UITableViewCell() }
            return cell
        } else if indexPath.row == 2 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: RecommendCell.Constants.identifier, for: indexPath
            ) as? RecommendCell
            else { return UITableViewCell() }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PostCell.Constants.identifier,
                for: indexPath
            ) as? PostCell
            else { return UITableViewCell() }
            cell.configure(post: posts[indexPath.row])
            return cell
        }
    }
}
