//
//  ShowcaseView.swift
//  WordsFactory
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import SwiftUI
import SwiftUIX

struct AuthView: View {
    @StateObject var vm: AuthViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            Image("signUp").resizable().aspectRatio(343/253, contentMode: .fit)
                .padding(.bottom, 16)
            Text("Sign up").multilineTextAlignment(.center).font(.title) .padding(.bottom, 8).height(72).padding(.horizontal, 17)
            Text("Create your account").multilineTextAlignment(.center).font(.plain).foregroundColor(.darkGray).height(64).padding(.horizontal, 17)
            
            MyTextField(text: $vm.name, placeholder: "Name").padding(.vertical, 16)
            MyTextField(text: $vm.email, placeholder: "E-mail").padding(.bottom, 16)
            MyTextField(text: $vm.pass, placeholder: "Password", type: .pass).padding(.bottom, 16)
            
            Button("Sign up") {
                vm.signupPressed()
            }.buttonStyle(BS.plain).maxWidth(.infinity).padding(.bottom, 40)
            
            NavigationLink("", isActive: $vm.main) {
                TabbedView()
            }.hidden()
        }.padding(.horizontal, 16).padding(.top, 102)
            .navigationBarHidden(true)
    }
}

//struct ShowcaseView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowcaseView(vm: .init(.init()))
//    }
//}
