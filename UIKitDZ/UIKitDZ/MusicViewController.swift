// MusicViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// Экран с музыкальной композицией
final class MusicViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var playButton: UIButton!
    @IBOutlet var currentValueLabel: UILabel!
    @IBOutlet var musicSlider: UISlider!
    @IBOutlet var musicDescriptionLabel: UILabel!
    @IBOutlet var musicTitleLabel: UILabel!
    @IBOutlet var musicImageView: UIImageView!

    private var player = AVAudioPlayer()
    var timer: Timer?
    var music: Music?

    override func viewDidLoad() {
        super.viewDidLoad()
        musicImageView.image = UIImage(named: music?.image ?? "nil")
        musicTitleLabel.text = music?.title
        musicDescriptionLabel.text = music?.description
    }

    // MARK: - IBAction

    @IBAction func playButtonTapped(_ sender: UIButton) {
        playButton.setImage(UIImage(systemName: "stop.circle"), for: .normal)
    }

    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: true)
    }

    private func setMusic() {
        guard let music = music else { return }
        musicImageView.image = UIImage(named: music.image)
        musicTitleLabel.text = music.title
        musicDescriptionLabel.text = music.description
    }

    // MARK: - Private Methods

    private func setPlayer() {
        if player.isPlaying {
            playButton.setImage(UIImage(systemName: "stop.circle"), for: .normal)
            player.stop()
        } else {
            playButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
            guard let pathAudio = Bundle.main.path(forResource: music?.nameMusic, ofType: "mp3") else { return }

            do {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: pathAudio))
                player.play()
            } catch {
                print("Error")
            }
        }
    }
}
