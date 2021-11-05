//
//  ShowcaseView.swift
//  WordsFactory
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import SwiftUI
import SwiftUIX

struct MainView: View {
    @StateObject var vm: MainViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            MyTextField(text: $vm.query, type: .search) {
                vm.search()
            }
            if let info = vm.info {
                ScrollView(.vertical) {
                    WordInfoView(info: info)
                }.maxHeight(.infinity).overlay(alignment: .bottom) {
                    Button("Add to Dictionary") {
                        vm.addToDict()
                    }.buttonStyle(BS.plain).padding(.bottom, 16).padding(.horizontal, 33)
                }
            } else {
                Spacer()
                ZStack {
                    VStack(spacing: 32) {
                        Image("noword").resizable().aspectRatio(375/273, contentMode: .fit)
                        VStack(spacing: 8) {
                            Text("No word").font(.subtitle)
                            Text("Input something to find it in dictionary").font(.plain).foregroundColor(.darkGray)
                        }
                    }
                }
                Spacer()
            }
//            Image("signUp").resizable().aspectRatio(343/253, contentMode: .fit)
//                .padding(.bottom, 16)
//            Text("Sign up").multilineTextAlignment(.center).font(.title) .padding(.bottom, 8).height(72).padding(.horizontal, 17)
//            Text("Create your account").multilineTextAlignment(.center).font(.plain).foregroundColor(.darkGray).height(64).padding(.horizontal, 17)
//
//            Button("Sign up") {
//                vm.signupPressed()
//            }.buttonStyle(BS.plain).maxWidth(.infinity).padding(.bottom, 40)
//
//            NavigationLink("", isActive: $vm.main) {
//                Text("main")
//            }.hidden()
        }.navigationBarHidden(true)
            .padding(.horizontal, 16).padding(.top, 102)
            .navigationBarHidden(true)
    }
}

//struct ShowcaseView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowcaseView(vm: .init(.init()))
//    }
//}
