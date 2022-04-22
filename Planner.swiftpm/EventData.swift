//
//  File.swift
//  Planner
//
//  Created by Minji Choi on 2022/04/05.
//

import SwiftUI

class EventData: ObservableObject {
    @Published var events: [Event] = [
        Event(symbol: "gift.fill",
              color: .red,
              title: "My B-Day",
              tasks: [
                EventTask(text: "making taco"),
                EventTask(text: "visiting viva"),
                EventTask(text: "Eat Takoyaki"),
              ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 30)),
//        Event(symbol: "theatermasks.fill")
    ]
    
    func delete(_ event: Event) {
        events.removeAll {$0.id == event.id }
    }
    
    func add(_ event: Event) {
        events.append(event)
    }
    
    func exists(_ event: Event) -> Bool {
        events.contains(event)
    }
    
    func sortedEvents(period: Period) -> Binding<[Event]> {
        Binding<[Event]>(
            get: {
                self.events
                    .filter {
                        switch period {
                        case .nextSevenDays:
                            return $0.isWithinSevenDays
                        case .nextThirtyDays:
                            return $0.isWithinSevenDaysToThirtyDays
                        case .future:
                            return $0.isDistant
                        case .past:
                            return $0.isPast
                        }
                    }
                    .sorted {$0.date < $1.date}
            },
            set: { events in
                for event in events {
                    if let index = self.events.firstIndex(where: {$0.id == event.id}) {
                        self.events[index] = event
                    }
                }
            }
        )
    }
}

enum Period: String, CaseIterable, Identifiable {
    case nextSevenDays = "Next 7 days"
    case nextThirtyDays = "Next 30 days"
    case future = "Future"
    case past = "Past"
    
    var id: String { self.rawValue }
    var name: String { self.rawValue }
}

extension Date {
    static func from(month: Int, day: Int, year: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        let calendar = Calendar(identifier: .gregorian)
        if let date = calendar.date(from: dateComponents) {
            return date
        }
        else {
            return Date()
        }
    }
    
    static func roundedHoursFromNow(_ hours: Double) -> Date {
        let exactDate = Date(timeIntervalSinceNow: hours)
        guard let hourRange = Calendar.current.dateInterval(of: .hour, for: exactDate) else {
            return exactDate
        }
        return hourRange.end
    }
}
