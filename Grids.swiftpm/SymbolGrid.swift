//
//  File.swift
//  Grids
//
//  Created by Minji Choi on 2022/04/07.
//

import SwiftUI

struct SymbolGrid: View {
    @State private var isAddingSymbol = false
    @State private var isEditing = false
    
    private static let initialColumns = 3
    @State private var selectedSymbolName: String?
    @State private var numColumns = initialColumns
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: initialColumns)
    
    @State private var symbolNames = [
        "tshirt",
        "eyes",
        "eyebrow",
        "nose"
    ]
                    
    var columnsText: String {
        numColumns > 1 ? "\(numColumns) Columns" : "1 Columns"
    }
    
    var body: some View {
        VStack {
            if isEditing {
                Stepper(columnsText, value: $numColumns, in: 2...6, step: 1) { _ in
                    withAnimation { gridColumns = Array(repeating: GridItem(.flexible()), count: numColumns) }
            }
            .padding()
        }
            ScrollView {
                LazyVGrid(columns: gridColumns) {
                    ForEach(symbolNames, id: \.self) { name in
                        NavigationLink(destination: ItemDetail(symbolName: name)) {
                            ZStack(alignment: .topTrailing) {
                                Image(systemName: name)
                                    .resizable()
                                    .scaledToFit()
                                    .symbolRenderingMode(.hierarchical)
                                    .foregroundColor(.accentColor)
                                    .ignoresSafeArea(.container, edges: .bottom)
                                    .cornerRadius(8)
                                if isEditing {
                                    Button {
                                        guard let index = symbolNames.firstIndex(of: name) else { return }
                                        withAnimation {
                                            _ = symbolNames.remove(at: index)
                                        }
                                    } label: {
                                        Image(systemName: "xmark.square.fill")
                                            .font(Font.title)
                                            .symbolRenderingMode(.palette)
                                            .foregroundStyle(.white, Color.red)
                                    }
                                    .offset(x: 7, y: -7)
                                }
                            }
                            .padding()
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        .navigationBarTitle("My Symbol")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isAddingSymbol, onDismiss: addSymbol) {
            SymbolPicker(name: $selectedSymbolName)
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                Button(isEditing ? "Done": "Edit") {
                    withAnimation { isEditing.toggle() }
                    
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isAddingSymbol = true
                } label: {
                    Image(systemName: "plus")
                }
                .disabled(isEditing)
            }
        }
    }
    func addSymbol() {
        guard let name = selectedSymbolName else { return }
        withAnimation {
            symbolNames.insert(name, at: 0)
        }
    }
}

struct GridView_Preview: PreviewProvider {
    static var previews: some View {
        SymbolGrid()
    }
}
