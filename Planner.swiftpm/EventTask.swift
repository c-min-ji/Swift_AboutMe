//
//  File.swift
//  Planner
//
//  Created by Minji Choi on 2022/04/05.
//

import Foundation

struct EventTask: Identifiable, Hashable {
    var id = UUID()
    var text: String
    var isCompleted = false
    var isNew = false
}
