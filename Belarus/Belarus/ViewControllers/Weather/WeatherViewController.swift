//
//  WeatherViewController.swift
//  Belarus
//
//  Created by user on 13.10.22.
//

import Foundation
import UIKit
import AVFoundation

class WeatherViewController: UIViewController {
    
    private var looper: AVPlayerLooper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundVideo()
    }
    
    private func backgroundVideo() {
        guard let videoURL = Bundle.main.path(forResource: "clouds", ofType: "mp4") else { return }
        let url = URL(fileURLWithPath: videoURL)
        do {
            let item = AVPlayerItem(url: url)
            let player = AVQueuePlayer(items: [item])
            looper = AVPlayerLooper(player: player, templateItem: item)
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = view.bounds
            playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            view.layer.addSublayer(playerLayer)
            player.play()
        }
    }
}
