// PlaylistViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// Экран со списком музыкальных композиций
final class PlaylistViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var twoDescription: UILabel!
    @IBOutlet var twoTitle: UILabel!
    @IBOutlet var twoImage: UIImageView!
    @IBOutlet var oneDescription: UILabel!
    @IBOutlet var oneTitle: UILabel!
    @IBOutlet var oneImage: UIImageView!

    // MARK: - Private Properties

    private var musicOne = Music(
        image: "Artists",
        title: "DIARO",
        description: "On The Way",
        time: "04:30",
        nameMusic: "01 On The Way"
    )
    private var musicTwo = Music(
        image: "Queen",
        title: "Demeter",
        description: "Utopia",
        time: "03:49",
        nameMusic: "01 Utopia"
    )

    // MARK: - Override Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        oneImage.image = UIImage(named: "Artists")
        oneTitle.text = musicOne.title
        oneDescription.text = musicOne.description
        twoImage.image = UIImage(named: "Queen")
        twoTitle.text = musicTwo.title
        twoDescription.text = musicTwo.description
    }

    // MARK: - IBAction

    @IBAction func showFirstSong(_ sender: Any) {
        transitionToMusic(music: Music(
            image: "Artists",
            title: "DIARO",
            description: "On The Way",
            time: "04:30",
            nameMusic: "01 On The Way"
        ))
    }

    @IBAction func showTwoSong(_ sender: Any) {
        transitionToMusic(music: Music(
            image: "Queen",
            title: "Demeter",
            description: "Utopia",
            time: "03:49",
            nameMusic: "01 Utopia"
        ))
    }

    // MARK: - Private Methods

    private func transitionToMusic(music: Music) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let musicViewController = storyboard
            .instantiateViewController(withIdentifier: "MusicViewController") as? MusicViewController else { return }
        musicViewController.music = Music(
            image: music.image,
            title: music.title,
            description: music.description,
            time: music.time,
            nameMusic: music.nameMusic
        )

        musicViewController.modalPresentationStyle = .formSheet
        present(musicViewController, animated: true)
    }
}
