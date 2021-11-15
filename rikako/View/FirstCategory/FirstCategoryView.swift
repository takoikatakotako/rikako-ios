//import SwiftUI
//
//struct FirstCategoryView: View {
//    @StateObject var viewModel = FirstCategoryViewModel()
//    
//    var body: some View {
//        NavigationView {
//            List(viewModel.subCategories) { subCategory in
//                NavigationLink(
//                    destination: SecondCategoryView(mainCategory: mainCategory),
//                    label: {                        
//                        CategoryRow(
//                            imagePath: subCategory.imagePath,
//                            name: subCategory.name, check: false
//                        )
//                    })
//            }
//            .onAppear {
//                viewModel.fetchMainCategories()
//            }
//            .navigationTitle("カテゴリ一覧")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//    }
//}
//
//struct CategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        FirstCategoryView()
//    }
//}
