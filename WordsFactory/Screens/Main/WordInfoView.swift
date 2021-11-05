//
//  WordInfoView.swift
//  WordsFactory
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import SwiftUI

struct WordInfoView: View {
    let am = MusicServiceSingleton.shared
    let info: WordInfoModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .bottom, spacing: 16) {
                    Text(info.word ?? "").font(.title)
                    Text(info.phonetic ?? "").font(.plainMedium).foregroundColor(.primary)
                    Image("sound").resizable().width(25).height(22).onTapGesture {
                        guard let str = info.phonetics.first?.audio else { return }
                        am.play(str)
                    }
                }
                if let meaning = info.meanings.first {
                    HStack(alignment: .bottom, spacing: 16) {
                        Text("Part of Speech:").font(.subtitle)
                        Text(meaning.partOfSpeech).font(.plainMedium)
                    }
                    
                    Text("Meanings:").font(.subtitle)
                    VStack(spacing: 10) {
                        ForEach(Array(meaning.definitions.enumerated()), id: \.offset) { (index, entry) in
                            DefCardView(info: entry)
                        }
                    }
                }
                
            }
            Spacer()
        }.padding(.top, 16)
    }
}

//struct WordInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        WordInfoView()
//    }
//}
