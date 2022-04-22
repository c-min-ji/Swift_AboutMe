//
//  File.swift
//  Planner
//
//  Created by Minji Choi on 2022/04/05.
//

import SwiftUI

struct Event: Identifiable, Hashable {
    var id = UUID()
    var symbol: String = EventSymbols.randomName()
    var color: Color = ColorOptions.random()
    var title = ""
    var tasks = [EventTask(text: "")]
    var date = Date()
    
    var remainingTaskCount: Int {
        tasks.filter { !$0.isCompleted }.count
    }
    
    var isCompleted: Bool {
        tasks.allSatisfy{ $0.isCompleted }
    }
    
    var isPast: Bool {
        date < Date.now
    }
    
    var isWithinSevenDays: Bool {
        !isPast && date < Date.now.sevenDaysOut
    }
    
    var isWithinSevenDaysToThirtyDays: Bool {
        !isPast && !isWithinSevenDays && date < Date.now.thirtyDaysOut
    }
    
    var isDistant: Bool {
        date >= Date().thirtyDaysOut
    }
    
    static var example = Event(
        symbol: "case.fill",
        title: "Seoul Trip",
        tasks: [
            EventTask(text: "Buy palne ticket"),
            EventTask(text: "Get a new bathing suit"),
            EventTask(text: "find a airbnb"),
        ],
        date: Date(timeIntervalSinceNow: 60 * 60 * 24 * 365 * 1.5))
    
}

extension Date {
    var sevenDaysOut: Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day, value: 7, to: self) ?? self
    }
    
    var thirtyDaysOut: Date {
        Calendar.autoupdatingCurrent.date(byAdding: .month, value: 30, to: self) ?? self
    }
}
