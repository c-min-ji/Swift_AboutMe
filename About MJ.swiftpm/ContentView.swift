//홈화면
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView { //TabView는 네비게이션(메뉴) 설정 뷰
            
            HomeView()
                .tabItem{
                    Label("Home", systemImage: "person")
                }
            
            StoryView()
                .tabItem {
                    Label("Story", systemImage: "book")
                }
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
            
            FunFactView()
                .tabItem {
                    Label("Fun Facts", systemImage: "hand.thumbsup")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
