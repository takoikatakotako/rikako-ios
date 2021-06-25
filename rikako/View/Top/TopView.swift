import SwiftUI

struct TopView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                        .renderingMode(.template)
                    Text("ホーム")
                }
            FirstCategoryView()
                .tabItem {
                    Image(systemName: "books.vertical")
                        .renderingMode(.template)
                    Text("カテゴリ")
                }
            ConfigView()
                .tabItem {
                    Image(systemName: "gearshape")
                        .renderingMode(.template)
                    Text("設定")
                }
        }
        .accentColor(Color("main"))
        .background(Color.white)
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
