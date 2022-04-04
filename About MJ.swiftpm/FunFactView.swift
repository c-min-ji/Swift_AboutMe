//
//  File.swift
//  About MJ
//
//  Created by Minji Choi on 2022/04/04.
//

import SwiftUI

struct FunFactView: View {
    @State private var funFact = ""
    var body: some View {
        VStack {
            Text("Fun Facts")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(funFact)
                .padding()
                .font(.title)
                .frame(minHeight: 400)
            
            Button("Show Random Fact") {
                funFact = information.funFacts.randomElement()!
            }
        }
        .padding()
    }
}

struct FunFactView_PreViews: PreviewProvider {
    static var previews: some View {
        FunFactView()
    }
}
