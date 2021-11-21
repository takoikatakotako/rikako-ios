import SwiftUI
import Combine

class TutorialAndSetCategory8thViewModel: ObservableObject {
    private let jsonRepository = JsonRepository()
    
    var subscriptions = Set<AnyCancellable>()
    @Published var subCategories: [CategoryResponse] = []

    func fetchMainCategories() {
        jsonRepository.fetchSubCategories(fileName: "fp-categories.json")
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

struct TutorialAndSetCategory8th: View {
    @StateObject var viewModel = TutorialAndSetCategory8thViewModel()
    
    var body: some View {
        List(viewModel.subCategories) { subCategory in
            NavigationLink(
                destination: TutorialAndSetCategory9th(categoryId: subCategory.categoryId),
                label: {
                    CategoryRow(
                        imagePath: subCategory.imagePath,
                        name: subCategory.name, check: false
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
        TutorialAndSetCategory8th()
    }
}
