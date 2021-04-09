import SwiftUI
import Combine

class DownloadViewModel: ObservableObject {
    let jsonRepository = JsonRepository()
    var subscriptions = Set<AnyCancellable>()

    func download(categoryId: Int) {
        jsonRepository.fetchCategory(categoryId: categoryId)
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
        }, receiveValue: { category in
            self.downloadCategory(category: category)
        })
        .store(in: &self.subscriptions)
    }
    
    func downloadCategory(category: Category) {
        // 保存する
        print(category)
    }
}
