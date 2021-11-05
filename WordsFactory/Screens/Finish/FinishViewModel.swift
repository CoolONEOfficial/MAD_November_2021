//
//  ShowcaseViewModel.swift
//  WordsFactory
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import Foundation
import SwiftUI

class FinishViewModel: ViewModel {
//    @Published var dict: [LocalWordModel] = [] {
//        didSet {
//            UserDefaults(suiteName: "group.wordsfactory")!.set(try? JSONEncoder().encode(dict), forKey: "dict")
//            questions = Array(dict.sorted { $0.level > $1.level }.prefix(10))
//        }
//    }
//
    var correct = 0
    var incorrect = 0
    
    var restart: (() -> Void)?
    
    var close: (() -> Void)?
    
    override func backPressed() {
        super.backPressed()
        close?()
    }
    
    func again() {
        restart?()
    }
}
