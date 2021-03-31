import SwiftUI

struct SecondCategoryView: View {
    var body: some View {
        List {
            Button(action: {
                
            }, label: {
                Text("xxx")
            })
        }
        .navigationTitle("カテゴリ一覧")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SecondCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SecondCategoryView()
    }
}
