//
//  StartViewModel.swift
//  CoolWatch WatchKit Extension
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import Foundation
import SwiftUI

class StartViewModel: ObservableObject {
    @Published var dict: [LocalWordModel] = []
    
    var timer: Timer?
    
    @Published var seconds: Int = 5
    
    @Published var questions = false
    
    @Published var anim = false
    
    func appear() {
        dict = (try? JSONDecoder().decode([LocalWordModel].self, from: UserDefaults(suiteName: "group.wordsfactory")!.data(forKey: "dict") ?? .init())) ?? []
        
        timer = .scheduledTimer(withTimeInterval: 1, repeats: true, block: timerFire)
        withAnimation(.linear(duration: 1).repeatCount(6, autoreverses: false)) {
            anim = true
        }
    }

    func timerFire(_ timer: Timer) {
        seconds = (seconds ?? 0) - 1
        if seconds == -1 {
            timer.invalidate()
            seconds = 5
            questions = true
            anim = false
        }
    }
}
