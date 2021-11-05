//
//  Notifications.swift
//  WordsFactory
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import Foundation
import SwiftUI

class Notifications: ObservableObject {
    @Published var alert: Alert?
}

//extension Alert: ExpressibleByStringInterpolation {
//    init(stringInterpolation: String) {
//        self.init(title: stringInterpolation, message: nil, dismissButton: nil)
//    }
//}
