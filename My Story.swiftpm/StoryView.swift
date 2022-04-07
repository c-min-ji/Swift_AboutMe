//
//  File.swift
//  My Story
//
//  Created by Minji Choi on 2022/04/05.
//

import SwiftUI

struct StoryView: View {
    
    var body: some View {
        NavigationView {
            StoryPageView(story: story, pageIndex: 0)
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
