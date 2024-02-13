// PlaylistViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// Экран со списком музыкальных композиций
final class PlaylistViewController: UIViewController {
    
    // MARK: - Private Properties
    private var player = AVAudioPlayer()
    
    // MARK: - IBOutlets
    @IBOutlet var durationLabelLetItBe: UILabel!
    @IBOutlet var durationLabelYesterday: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for audio in ["OnTheWay", "Utopia"] {
            do {
                if let audioPath = Bundle.main.path(forResource: audio, ofType: "mp3") {
                    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                }
            } catch {
                print("Error")
            }

            if audio == "OnTheWay" {
                let duration = Int(player.duration)
                if duration % 60 > 10 {
                    durationLabelLetItBe.text = "0\(duration / 60):\(duration % 60)"
                } else {
                    durationLabelLetItBe.text = "0\(duration / 60):0\(duration % 60)"
                }
            } else {
                let duration = Int(player.duration)
                if duration % 60 > 10 {
                    durationLabelYesterday.text = "0\(duration / 60):\(duration % 60)"
                } else {
                    durationLabelYesterday.text = "0\(duration / 60):0\(duration % 60)"
                }
            }
        }
    }
        // MARK: - IBActions
    @IBAction func letItBeButton(_ sender: Any) {}

    @IBAction func yesterdayButton(_ sender: Any) {}
}
