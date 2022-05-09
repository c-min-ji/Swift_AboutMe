//
//  File.swift
//  Grids
//
//  Created by Minji Choi on 2022/04/07.
//

import SwiftUI

struct ItemDetail: View {
    
    var symbolName: String
    
    var body: some View {
        VStack {
            Text(symbolName)
                .font(.system(.largeTitle, design: .rounded))
            Image(systemName: symbolName)
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(.accentColor)
            
        }
        .padding()
    }
}

struct Details_Preview: PreviewProvider {
    static var previews: some View {
        ItemDetail(symbolName: "magnifyingglass")
    }
}
