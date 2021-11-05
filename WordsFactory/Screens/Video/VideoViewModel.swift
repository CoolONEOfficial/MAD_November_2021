//
//  ShowcaseViewModel.swift
//  WordsFactory
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import Foundation
import SwiftUI

class VideoViewModel: ViewModel, CheckProtocol {
    func check(_ url: URL?) -> Bool {
        url?.absoluteString.contains("video-zone") == true
    }
    //@Published var auth = false
    
//    @Published var tab = 0
//    
//    struct TabInfo {
//        let title: String
//        let image: String
//        let caption: String
//    }
//    
//    let tabs: [TabInfo] = [
//        .init(title: "Learn anytime\nand anywhere", image: "Image-1", caption: "Quarantine is the perfect time\nto spend your\nday learning something new, from anywhere!"),
//        .init(title: "Find a course\nfor you", image: "Image-2", caption: "Quarantine is the perfect time to spend your\nday learning something new, from anywhere!"),
//        .init(title: "Improve your skills", image: "Image-3", caption: "Quarantine is the perfect time\nto spend your\nday learning something new, from anywhere!")
//    ]
//    
//    func skip() {
//        self.tab = tabs.count - 1
//    }
//    
//    func toAuth() {
//        self.auth = true
//    }
//    
//    func nextPressed() {
//        if tab == tabs.count - 1 {
//            toAuth()
//        } else {
//            withAnimation {
//                tab += 1
//            }
//        }
//    }
}
