import SwiftUI

struct FirstCategoryView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: SecondCategoryView(),
                    label: {
                        Text("Hello, World!")
                    })
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
