//
//  MeaningCardView.swift
//  WordsFactory
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import Foundation
import SwiftUI

struct DefCardView: View {
    let info: DefinitionModel
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 8) {
                Text(info.definition).font(.plain)
                HStack(spacing: 0) {
                    Text("Example: ").font(.plain).foregroundColor(.secondary)
                    Text(info.example).font(.plain).lineLimit(1)
                }
            }
            Spacer()
        }.padding(16).background {
            RoundedRectangle(cornerRadius: 16).stroke(lineWidth: 0.5).foregroundColor(.gray)
        }
    }
}
