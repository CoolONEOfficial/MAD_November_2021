//
//  TabbedView.swift
//  WordsFactory
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import SwiftUI
import SwiftUIX

struct TabbedView: View {
    @EnvironmentObject var notifications: Notifications
    
    enum Tab: Int, CaseIterable {
        case main
        case training
        case video
        
        var iconName: String {
            switch self {
            case .main:
                return "dict"
                
            case .training:
                return "training"
                
            case .video:
                return "video"
            }
        }
        
        var desc: String {
            switch self {
            case .main:
                return "Dictionary"
                
            case .training:
                return "Training"
                
            case .video:
                return "Video"
            }
        }
        
        @ViewBuilder
        func icon(_ bool: Bool) -> some View {
            VStack {
                Image(iconName).resizable().width(20).height(20).scaledToFit()
                Text(desc)
            }.foregroundColor(bool ? Color.primary : Color.gray).padding(20)
        }
    }
    
    @ViewBuilder
    var content: some View {
        switch tab {
        case .main:
            MainView(vm: .init(notifications))
            
        case .video:
            VideoView(vm: .init(notifications))
            
        case .training:
            TrainingView(vm: .init(notifications))
        }
    }
    
    @State var tab: Tab = .main
    
    var body: some View {
        VStack {
            content.padding(.top, -100).maxHeight(.infinity)
            RoundedRectangle(cornerRadius: 8).strokeBorder(lineWidth: 0.5).foregroundColor(.darkGray).height(106).padding(.bottom, -8).overlay(alignment: .top) {
                HStack {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        tab.icon(self.tab == tab).onTapGesture(perform: {
                            withAnimation {
                                self.tab = tab
                            }
                        })
                        if tab != Tab.allCases.last {
                            Spacer()
                        }
                    }
                }
            }
        }.navigationBarHidden(true).ignoresSafeArea(.all, edges: .bottom)
    }
}

struct TabbedView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedView()
    }
}
