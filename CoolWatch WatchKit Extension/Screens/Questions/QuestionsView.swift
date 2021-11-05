//
//  ShowcaseView.swift
//  WordsFactory
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import SwiftUI
import SwiftUIX

struct AnswerButtonStyle: ButtonStyle {
    
    let index: Int
    
    func makeBody(configuration: Configuration) -> some View {
        
        
        HStack(spacing: 16) {
            Text(["A", "B", "C"][index] + ".")
            configuration.label
            Spacer()
        }.padding(.horizontal, 24).padding(.vertical, 16).background(RoundedRectangle(cornerRadius: 8).strokeBorder(lineWidth: 0.5).foregroundColor(configuration.isPressed ? .primary : .darkGray))
    }
}

struct QuestionsView: View {
    @StateObject var vm: QuestionsViewModel
    
    //@EnvironmentObject var notifications: Notifications

    func answerView(index: Int, text: String) -> some View {
        Button(text) {vm.pickAnswer(index, answer: text)}.buttonStyle(AnswerButtonStyle(index: index))
//        HStack(spacing: 16) {
//            Text(["A", "B", "C"][index] + ".")
//            Text(text)
//            Spacer()
//        }.padding(.horizontal, 24).padding(.vertical, 16).background(RoundedRectangle(cornerRadius: 8).strokeBorder(lineWidth: 0.5).foregroundColor(.darkGray))
    }
    
    var foreachView: some View {
        ForEach(0..<3) { index in
            let text = vm.answers[index]
            answerView(index: index, text: text)
            
        }
    }
    
    @ViewBuilder
    var questionContent: some View {
        Text(vm.currentQuestion?.model.meanings.first?.definitions.first?.definition ?? "").font(.caption).multilineTextAlignment(.center).padding(.bottom, 24)
        
        VStack {
            foreachView
        }
    }
    
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 0) {
                
                if vm.currentQuestion != nil {
                    questionContent.padding(.horizontal, 16)
                }
            }
        }.navigationBarHidden(true).onAppear {
            
            vm.appear()
        }
//        .fullScreenCover(isPresented: $vm.results, onDismiss: nil, content: {
//            FinishView(vm: {
//                let vm = FinishViewModel(notifications, open: $vm.results)
//                vm.correct = self.vm.correctTotal
//                vm.incorrect = self.vm.failureTotal
//                vm.restart = self.vm.restart
//                vm.close = { self.vm.open = false }
//                return vm
//            }())
//        })
        
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
