//import SwiftUI
//import Combine
//
//class FirstCategoryViewModel: ObservableObject {
//    private let jsonRepository = JsonRepository()
//    
//    var subscriptions = Set<AnyCancellable>()
//    @Published var subCategories: [SubCategory] = []
//
//    func fetchMainCategories() {
//        jsonRepository.fetchSubCategories(fileName: "fp-categories.json")
//        .sink(receiveCompletion: { completion in
//            switch completion {
//            case .finished:
//                break
//            case let .failure(error):
//                print(error)
//                // self.showingAlert = true
//                // self.errorMessage = error.localizedDescription
//                break
//            }
//        }, receiveValue: { subCategories in
//            DispatchQueue.main.async {
//                self.subCategories = subCategories
//            }
//        })
//        .store(in: &self.subscriptions)
//    }
//}
