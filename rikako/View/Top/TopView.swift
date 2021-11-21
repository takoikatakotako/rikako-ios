import SwiftUI

struct TopView: View {
    @State var tabSelection: Int = 0
    var body: some View {
        TabView(selection: $tabSelection) {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                        .renderingMode(.template)
                    Text("ホーム")
                }
                .tag(0)
            CategoriesView()
                .tabItem {
                    Image(systemName: "books.vertical")
                        .renderingMode(.template)
                    Text("カテゴリ")
                }
                .tag(1)
            ConfigView(tabSelection: $tabSelection)
                .tabItem {
                    Image(systemName: "gearshape")
                        .renderingMode(.template)
                    Text("設定")
                }
                .tag(2)
        }
        .accentColor(Color(R.color.main.name))
        .background(Color.white)
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
