import SwiftUI
import Combine

class FirstCategoryViewModel: ObservableObject {
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
            self.mainCategories = mainCategories
        })
        .store(in: &self.subscriptions)
        
    }
}
