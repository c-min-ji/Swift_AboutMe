//
//  File.swift
//  My Story
//
//  Created by Minji Choi on 2022/04/05.
//

import Foundation

struct Story {
    
    let pages: [StoryPage]
    
    subscript(_ pageIndex: Int) -> StoryPage {
        return pages[pageIndex]
    }
}

struct StoryPage {
    let text: String
    let choices: [Choice]
    
    init(_ text: String, choices:[Choice]) {
        self.text = text
        self.choices = choices
    }
}

struct Choice {
    let text: String
    let destination: Int
}
