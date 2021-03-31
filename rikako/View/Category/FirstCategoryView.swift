import SwiftUI

struct FirstCategoryView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Hello, World!")
                Text("Hello, World!")
            }
            .navigationTitle("カテゴリ一覧")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        FirstCategoryView()
    }
}
