//
//  ShowcaseViewModel.swift
//  WordsFactory
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import Foundation
import SwiftUI
import WidgetKit

class QuestionsViewModel: ViewModel {
    @Published var dict: [LocalWordModel] = [] {
        didSet {
            UserDefaults(suiteName: "group.wordsfactory")!.set(try? JSONEncoder().encode(dict), forKey: "dict")
            questions = Array(dict.sorted { $0.level > $1.level }.prefix(10))
            WidgetCenter.shared.reloadAllTimelines()
        }
    }
    
    var timer: Timer?
    
    @Published var seconds: Int = 5
    
    @Published var results = false
    
    @Published var questions: [LocalWordModel] = []
    
    var correctTotal = 0
    var failureTotal = 0
    
    var questionIndex = 0 {
        didSet {
            correctIndex = Int.random(in: 0..<2)
            updateInvalids()
        }
    }
    
    var currentQuestion: LocalWordModel? {
        questions.indices.contains(questionIndex) ? questions[questionIndex] : nil
    }
    
    private var lastInvalids: [String] = []
    
    var answers: [String] = []
    
    //var invalids: [String] = []
    
    var getInvalidText: String {
        let word = (dict.filter { $0.model.word != currentQuestion?.model.word && !lastInvalids.contains($0.model.word ?? "") }.compactMap(\.model.word) + ["Cooking", "Smiling", "Freezing"]).randomElement() ?? ""
        lastInvalids.append(word)
        return word
    }

    func updateInvalids() {
        var answers = [ getInvalidText, getInvalidText ]
        lastInvalids.removeAll()
        answers.insert(currentQuestion?.model.word ?? "", at: correctIndex)
        self.answers = answers
    }
    
    var correctIndex = 0
    
    func appear() {
        dict = (try? JSONDecoder().decode([LocalWordModel].self, from: UserDefaults(suiteName: "group.wordsfactory")!.data(forKey: "dict") ?? .init())) ?? []
        
        questionIndex = 0
        timer = .scheduledTimer(withTimeInterval: 1, repeats: true, block: timerFire)
    }

    func timerFire(_ timer: Timer) {
        withAnimation {
            seconds -= 1
            
            if seconds == 0 {
                pickFailure()
                
            }
        }
    }

    func pickFailure() {
        guard let dictIndex = dict.firstIndex(where: { $0.model.word == currentQuestion?.model.word }) else { return }
        failureTotal += 1
        dict[dictIndex].level -= 1
        didPick()
    }
    
    func pickCorrect() {
        guard let dictIndex = dict.firstIndex(where: { $0.model.word == currentQuestion?.model.word }) else { return }
        correctTotal += 1
        dict[dictIndex].level += 1
        didPick()
    }

    func didPick() {
        seconds = 5
        if questionIndex == questions.count - 1 {
            timer?.invalidate()
            
            results = true
        } else {
            questionIndex += 1
        }
    }
    
    func pickAnswer(_ index: Int, answer: String) {
        
        if index == correctIndex {
            pickCorrect()
        } else {
            pickFailure()
        }
    }
    
    func restart() {
        seconds = 5
        results = false
        questions = []
        correctTotal = 0
        failureTotal = 0
        //answers = []
        appear()
    }
}
