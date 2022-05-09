import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SymbolGrid()
            }
            .navigationViewStyle(.stack)
        }
    }
}
