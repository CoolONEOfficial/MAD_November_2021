//
//  ShowcaseViewModel.swift
//  WordsFactory
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import Foundation
import SwiftUI

class TrainingViewModel: ViewModel {
    @Published var dict: [LocalWordModel] = []
    
    var timer: Timer?
    
    @Published var seconds: Int?
    
    @Published var questions = true//false TODO: remove
    
    @Published var anim = false
    
    func appear() {
        dict = (try? JSONDecoder().decode([LocalWordModel].self, from: UserDefaults(suiteName: "group.wordsfactory")!.data(forKey: "dict") ?? .init())) ?? []
    }

    func startTap() {
        seconds = 5
        timer = .scheduledTimer(withTimeInterval: 1, repeats: true, block: timerFire)
        withAnimation(.linear(duration: 1).repeatCount(6, autoreverses: false)) {
            anim = true
        }
    }

    func timerFire(_ timer: Timer) {
        seconds = (seconds ?? 0) - 1
        if seconds == -1 {
            timer.invalidate()
            seconds = nil
            questions = true
            anim = false
        }
    }
}
