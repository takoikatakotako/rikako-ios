import SwiftUI

struct TutorialAndSetCategoryEighth: View {
    @StateObject var viewModel = FirstCategoryViewModel()
    
    var body: some View {
        List(viewModel.mainCategories) { mainCategory in
            NavigationLink(
                destination: TutorialAndSetCategoryNineth(mainCategory: mainCategory),
                label: {
                    CategoryRow(
                        imagePath: mainCategory.imagePath,
                        name: mainCategory.name, check: false
                    )
                })
        }
        .onAppear {
            viewModel.fetchMainCategories()
        }
        .navigationTitle("カテゴリ一覧")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TutorialAndSetCategoryEighth_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategoryEighth()
    }
}
