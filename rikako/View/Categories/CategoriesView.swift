import SwiftUI

struct CategoriesView: View {
    @StateObject var viewModel = CategoriesViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.subCategories) { subCategory in
                Button(action: {
                    viewModel.categoryTapped(subCategory: subCategory)
                }, label: {
                    if let categoryId = viewModel.selectedCategoryId {
                        CategoryRow(imagePath: subCategory.imagePath, name: subCategory.name, check: categoryId == subCategory.categoryId)
                    } else {
                        CategoryRow(imagePath: subCategory.imagePath, name: subCategory.name, check: false)
                    }
                })
            }
            .listStyle(.plain)
            .navigationTitle("カテゴリ")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            viewModel.fetchSubCategories(fileName: "fp-categories.json")
        }
        .alert(item: $viewModel.alert) { item in
            switch item {
            case let .select(categoryId, categoryName):
                return Alert(
                    title: Text("問題選択"),
                    message: Text("「\(categoryName)」を選択します。よろしいですか？"),
                    primaryButton: .default(Text("はい")) {
                        viewModel.downloadCategory(categoryId: categoryId)
                    },
                    secondaryButton: .cancel())
            }
        }
        .fullScreenCover(
            item: $viewModel.fullScreen,
            onDismiss: {
                viewModel.updateSelectedCategoryId()
            }){ item in
                DownloadView(categoryId: item.categoryId)
                    .animation(.none)
            }
            .navigationTitle("mainCategory.name")
            .navigationBarTitleDisplayMode(.inline)
    }
}

//struct SecondCategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondCategoryView(mainCategory: MainCategory.mock())
//    }
//}
