//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Alex on 13/06/2022.
//

import Foundation
import AVKit

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat) else {
        fatalError("Video file \(fileName).\(fileFormat) not found")
    }
    
    let videoPlayer = AVPlayer(url: url)
    videoPlayer.play()
    return videoPlayer
}
