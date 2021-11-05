//
//  ViewModel.swift
//  WordsFactory
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var notifications: Notifications
    @Binding var open: Bool
    
    init(_ notifications: Notifications, open: Binding<Bool>? = nil) {
        self.notifications = notifications
        self._open = open ?? .init(get: {false}, set: {_ in})
    }
    
    func backPressed() {
        open = false
    }
}
