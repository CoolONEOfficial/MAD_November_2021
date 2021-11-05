//
//  ContentView.swift
//  CoolWatch WatchKit Extension
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            StartView(vm: .init())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
