//
//  MusicServiceSingleton.swift
//  WordsFactory
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import Foundation
import AudioToolbox
import Alamofire
import AVFAudio

class MusicServiceSingleton {
    private init () {}
    
    static let shared = MusicServiceSingleton()
    
    var player: AVAudioPlayer?

    func play(_ str: String) {
        let url = URL(string: "https://" + str.trimmingCharacters(in: ["/"]))!
        AF.download(url).responseData(completionHandler: { res in
            guard let data = try? res.result.get() else { return }
            let player = try? AVAudioPlayer(data: data)
            player?.play()
            self.player = player
        })
    }
}
