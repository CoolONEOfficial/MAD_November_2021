//
//  StartView.swift
//  CoolWatch WatchKit Extension
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import SwiftUI
import SwiftUIX

struct StartView: View {

    @StateObject var vm: StartViewModel
    
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
            let sec = vm.seconds
            Text(secText).foregroundColor(secColor).font(.h1).width(100).height(100)
                .background(Circle().trim(from: vm.anim ? 0 : 1, to: 1).rotation(.degrees(-90)).stroke(style: .init(lineWidth: 10, lineCap: .round)).foregroundColor(secColor)) // todo: mirror
            
        }.onAppear {
            
            vm.appear()
            
        }.fullScreenCover(isPresented: $vm.questions, onDismiss: nil, content: { QuestionsView(vm: .init(open: $vm.questions)) })
    }
}

//struct StartView_Previews: PreviewProvider {
//    static var previews: some View {
//        StartView()
//    }
//}


//
//struct ShowcaseView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowcaseView(vm: .init(.init()))
//    }
//}
