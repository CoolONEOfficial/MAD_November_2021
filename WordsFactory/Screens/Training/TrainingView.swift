//
//  ShowcaseView.swift
//  WordsFactory
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import SwiftUI
import SwiftUIX

struct TrainingView: View {
    @StateObject var vm: TrainingViewModel
    
    @EnvironmentObject var notifications: Notifications
    
    var secText: String {
        switch vm.seconds {
        case 0:
            return "GO"
            
        default: return String(vm.seconds ?? 0)
        }
    }
    
    var secColor: Color {
        switch vm.seconds {
        case 0:
            return .primary
        case 1:
            return .init(hex: 0xEF4949)
        case 2:
            return .warning
        case 3:
            return .init(hex: 0x5BA092)
        case 4:
            return .secondary
        case 5:
            return .primary
        default: return .red
        }
    }

    var body: some View {
        VStack {
            Spacer()
            Text("""
There are \(vm.dict.count) words
in your Dictionary.

Start the Training?
""").font(.title).multilineTextAlignment(.center)
            Spacer()
            if let sec = vm.seconds  {
                Text(secText).foregroundColor(secColor).font(.h1).width(100).height(100)
                    .background(Circle().trim(from: vm.anim ? 0 : 1, to: 1).rotation(.degrees(-90)).stroke(style: .init(lineWidth: 10, lineCap: .round)).foregroundColor(secColor)) // todo: mirror
            } else {
                Button("Start") {
                    vm.startTap()
                }.buttonStyle(BS.plain).padding(.horizontal, 32)
            }
            Spacer()
        }.navigationBarHidden(true).onAppear {
            
            vm.appear()
            
        }.fullScreenCover(isPresented: $vm.questions, onDismiss: nil, content: { QuestionsView(vm: .init(notifications, open: $vm.questions)) })
        
//        NavigationView {
//            VStack(spacing: 0) {
//                HStack {
//                    Spacer()
//                    Button() {
//                        vm.skip()
//                    } label: {
//                        Text(vm.tab == vm.tabs.count - 1 ? "" : "Skip").font(.plainMedium).padding(16)
//                    }
//                }
//                
//                Spacer()
//                
//                TabView(selection: $vm.tab) {
//                    ForEach(Array(vm.tabs.enumerated()), id: \.offset) { (index, entry) in
//                        VStack(spacing: 0) {
//                            Image(entry.image).resizable().aspectRatio(375/264, contentMode: .fit)
//                                .padding(.bottom, 16)
//                            Text(entry.title).multilineTextAlignment(.center).font(.title) .padding(.bottom, 8).height(72).padding(.horizontal, 17)
//                            Text(entry.caption).multilineTextAlignment(.center).font(.plain).foregroundColor(.darkGray).height(64).padding(.horizontal, 17)
//                        }
//                    }
//                }
//                .tabViewStyle(.page(indexDisplayMode: .never))
//              
//                HStack {
//                    Spacer()
//                    ForEach(0..<vm.tabs.count) { index in
//                        let isSel = index == vm.tab
//                        HStack(spacing: 12) {
//                            RoundedRectangle(cornerRadius: 3).fill(isSel ? Color.secondary : Color.nonActive).height(6).width(isSel ? 16 : 6)
//                        }
//                    }
//                    Spacer()
//                }.height(6)
//                    .padding(.bottom, 72)
//                
//                Button(vm.tab == vm.tabs.count - 1 ? "Let's Start" : "Next") {
//                    vm.nextPressed()
//                }.buttonStyle(BS.plain).maxWidth(.infinity).padding(.horizontal, 32).padding(.bottom, 40)
//                
//                NavigationLink("", destination: AuthView(vm: .init(notifications)), isActive: $vm.auth).hidden()
//            }.navigationBarHidden(true)
//        }
    }
}
//
//struct ShowcaseView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowcaseView(vm: .init(.init()))
//    }
//}
