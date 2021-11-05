//
//  ShowcaseViewModel.swift
//  WordsFactory
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import Foundation
import SwiftUI
import Alamofire

class MainViewModel: ViewModel {
    @Published var main = false

    @Published var query = ""
    
    @Published var info: WordInfoModel?
    
    let nw = NetworkServiceSingleton.shared
    
    @Published var dict: [LocalWordModel] = (try? JSONDecoder().decode([LocalWordModel].self, from: UserDefaults(suiteName: "group.wordsfactory")!.data(forKey: "dict") ?? .init())) ?? [] {
        didSet {
            UserDefaults(suiteName: "group.wordsfactory")!.set(try? JSONEncoder().encode(dict), forKey: "dict")
        }
    }
    
    func search() {
        if NetworkReachabilityManager.default?.isReachable == true {
            nw.wordInfo(query) { res in
                switch res {
                case let .success(model):
                    self.info = model.first
                    
                case .failure:
                    self.notifications.alert = .init(title: Text("Word info get error"), message: nil, dismissButton: nil)
                }
            }
        } else if let word = dict.first(where: { $0.model.word?.lowercased() == query.lowercased() }) {
            self.info = word.model
        } else {
            self.notifications.alert = .init(title: Text("No internet and cached result!"), message: nil, dismissButton:  nil)
        }
    }
    
    func addToDict() {
        if let info = info {
            dict.append(.init(level: 0, model: info))
        }
    }
}
