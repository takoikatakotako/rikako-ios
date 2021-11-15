import SwiftUI
import Combine

class TutorialAndSetCategoryNinethViewModel: ObservableObject {
    private let jsonRepository = JsonRepository()
    private let userDefaultsRepository = UserDefaultsRepository()
    var subscriptions = Set<AnyCancellable>()
    @Published var subCategories: [SubCategory] = []

    func fetchSubCategories(fileName: String) {
        jsonRepository.fetchSubCategories(fileName: fileName)
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
        }, receiveValue: { subCategories in
            DispatchQueue.main.async {
                self.subCategories = subCategories
            }
        })
        .store(in: &self.subscriptions)
    }
}

struct TutorialAndSetCategory9th: View {
    let mainCategory: MainCategory
    @StateObject var viewModel = TutorialAndSetCategoryNinethViewModel()
    var body: some View {
        List(viewModel.subCategories) { subCategory in
            NavigationLink(destination: TutorialAndSetCategory10th(categoryId: subCategory.categoryId)) {
                CategoryRow(imagePath: subCategory.imagePath, name: subCategory.name, check: false)
            }
        }
        .onAppear {
            viewModel.fetchSubCategories(fileName: mainCategory.subCategoryName)
        }
        .navigationTitle(mainCategory.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TutorialAndSetCategoryNineth_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategory9th(mainCategory: MainCategory(name: "ss", image: "sss", subCategoryName: "sss"))
    }
}
