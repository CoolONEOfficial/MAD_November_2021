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
    
    @Published var dict: [WordInfoModel] = (try? JSONDecoder().decode([WordInfoModel].self, from: UserDefaults.standard.data(forKey: "dict") ?? .init())) ?? [] {
        didSet {
            UserDefaults.standard.set(try? JSONEncoder().encode(dict), forKey: "dict")
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
        } else if let word = dict.first(where: { $0.word?.lowercased() == query.lowercased() }) {
            self.info = word
        } else {
            self.notifications.alert = .init(title: Text("No internet and cached result!"), message: nil, dismissButton:  nil)
        }
    }
    
    func addToDict() {
        if let info = info {
            dict.append(info)
        }
    }
}
