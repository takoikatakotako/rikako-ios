import SwiftUI

struct SecondCategoryView: View {
    let mainCategory: MainCategory
    @StateObject var viewModel = SubCategoryViewModel()
    var body: some View {
        List(viewModel.subCategories) { subCategory in
            Button(action: {
                viewModel.categoryTapped(subCategory: subCategory)
            }, label: {
                CategoryRow(imagePath: subCategory.imagePath, name: subCategory.name)
            })
        }
        .onAppear {
            viewModel.fetchSubCategories(fileName: mainCategory.subCategoryName)
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
        .fullScreenCover(item: $viewModel.fullScreen) { item in
            DownloadView(categoryId: item.categoryId)
        }
        .navigationTitle(mainCategory.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SecondCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SecondCategoryView(mainCategory: MainCategory.mock())
    }
}
