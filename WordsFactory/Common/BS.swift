//
//  BS.swift
//  WordsFactory
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import SwiftUI
import Foundation

struct BS {
    static let plain = PlainButtonStyle()
}

struct PlainButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.font(.plainButton).foregroundColor(.white).maxWidth(.infinity).padding(.vertical, 16).padding(.horizontal, 32).background(RoundedRectangle(cornerRadius: 16).fill(Color.primary)).scaleEffect(configuration.isPressed ? 0.9 : 1)
    }
}
