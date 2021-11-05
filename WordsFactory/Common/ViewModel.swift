//
//  ViewModel.swift
//  WordsFactory
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var notifications: Notifications
    
    init(_ notifications: Notifications) {
        self.notifications = notifications
    }
}
