//
//  ShowcaseViewModel.swift
//  WordsFactory
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import Foundation
import SwiftUI

class AuthViewModel: ViewModel {
    @Published var main = false

    @Published var name = ""
    @Published var email = ""
    @Published var pass = ""
    
    func signupPressed() {
        guard !name.isEmpty, !email.isEmpty, !pass.isEmpty else {
            notifications.alert = .init(title: Text("Some fields is empty!"), message: nil, dismissButton: nil)
            return
        }

        guard email.contains("@") else {
            notifications.alert = .init(title: Text("Incorrect email"), message: nil, dismissButton: nil)
            return
        }
        
        UserDefaults.standard.set(true, forKey: "auth")
        main = true
    }
}
