import SwiftUI
import Combine

class TutorialAndSetCategoryEighthViewModel: ObservableObject {
    private let jsonRepository = JsonRepository()
    
    var subscriptions = Set<AnyCancellable>()
    @Published var mainCategories: [MainCategory] = []

    func fetchMainCategories() {
        jsonRepository.fetchMainCategory()
        .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case let .failure(error):
                print(error)
                // self.showingAlert = true
                // self.errorMessage = error.localizedDescription
                break
            }
        }, receiveValue: { mainCategories in
            DispatchQueue.main.async {
                self.mainCategories = mainCategories
            }
        })
        .store(in: &self.subscriptions)
    }
}

struct TutorialAndSetCategoryEighth: View {
    @StateObject var viewModel = TutorialAndSetCategoryEighthViewModel()
    
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
        .navigationBarBackButtonHidden(true)
    }
}

struct TutorialAndSetCategoryEighth_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategoryEighth()
    }
}
