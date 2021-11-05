//
//  CoolWidget.swift
//  CoolWidget
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import WidgetKit
import SwiftUI
import SwiftUIX

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct CoolWidgetEntryView : View {
    var entry: Provider.Entry
    
    @State var dict: [LocalWordModel] = (try? JSONDecoder().decode([LocalWordModel].self, from: UserDefaults(suiteName: "group.wordsfactory")!.data(forKey: "dict") ?? .init())) ?? [] {
        didSet {
            UserDefaults(suiteName: "group.wordsfactory")!.set(try? JSONEncoder().encode(dict), forKey: "dict")
        }
    }
    
    var body: some View {
        VStack(spacing: 4) {
            HStack {
                Text("Words Factory").font(.h3).padding(.horizontal, 16)
                Spacer()
            }.maxHeight(.infinity).background(Color.primary).foregroundColor(.white)
            HStack(alignment: .bottom) {
                Text("My Dictionary").font(.subtitle)
                Spacer()
                Text("\(dict.count) Words").font(.plain).foregroundColor(.black).opacity(0.5)
            }.maxHeight(.infinity).padding(.horizontal, 16)
            HStack(alignment: .bottom) {
                Text("I already remember ").font(.subtitle)
                Spacer()
                Text("\(dict.filter { $0.level > 5 }.count) Words").font(.plain).foregroundColor(.black).opacity(0.5)
            }.maxHeight(.infinity).padding(.horizontal, 16)
        }.background(Color.white)
    }
}

@main
struct CoolWidget: Widget {
    let kind: String = "CoolWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            CoolWidgetEntryView(entry: entry)
        }
        .supportedFamilies([ .systemMedium ])
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct CoolWidget_Previews: PreviewProvider {
    static var previews: some View {
        CoolWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
