//
//  MyTextField.swift
//  WordsFactory
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import Foundation
import SwiftUI
import SwiftUIX

struct MyTextField: View {

    enum TextType {
        case pass
        case plain
        case search
    }
    
    @Binding var text: String
    var placeholder: String = ""
    var type: TextType = .plain
    @State var isEye = true
    
    var didTapSearch: (() -> Void)? = nil
    
    @ViewBuilder
    var field: some View {
        if !isEye || type != .pass {
            TextField("", text: $text)
        } else {
            SecureField("", text: $text)
        }
    }
    
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                Group {
                    if text.isEmpty {
                        Text(placeholder)
                    }
                    field.maxWidth(.infinity)
                }.font(.plain).foregroundColor(.darkGray)
            }
            if type == .pass {
                Image(isEye ? "eye" : "noeye").resizable().width(24).height(24).onTapGesture {
                    isEye.toggle()
                }
            } else if type == .search {
                Image("search").resizable().width(24).height(24).onTapGesture {
                    didTapSearch?()
                }
            }
        }.padding(16).background(RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 1).foregroundColor(.darkGray))
    }
}
