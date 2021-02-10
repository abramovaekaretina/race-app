//
//  TestViewController.swift
//  race
//
//  Created by Ekaterina Abramova on 01.02.2021.
//  Copyright © 2021 Ekaterina Abramova. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class TestViewController: UIViewController {

    var videoPlayer: AVPlayer?
    var avPlayerLayer: AVPlayerLayer?

    override func viewDidLoad() {
        super.viewDidLoad()
//        if let videoPath = Bundle.main.path(forResource: "videoFile", ofType: "mp4") {
//            let videoURL = URL(fileURLWithPath: videoPath)
//            videoPlayer = AVPlayer(url: videoURL)
//            avPlayerLayer = AVPlayerLayer(player: videoPlayer)
//            avPlayerLayer?.videoGravity = AVLayerVideoGravity.resize
//            videoView.layer.addSublayer(avPlayerLayer ?? AVPlayerLayer())
//            videoPlayer?.play()
//        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        playVideo()
    }

    func playVideo() {
        guard let path = Bundle.main.path(forResource: "videoFile", ofType: "mp4") else {
            print("videoFile.mp4 not found")
            return
        }

        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }

}
