import SwiftUI
import Combine

class DownloadViewModel: ObservableObject {
    let jsonRepository = JsonRepository()
    let fileRepository = FileRepository()
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
        var images: [String] = []
        for question in category.questions {
            for image in question.images {
                images.append(image)
            }
        }
        
        
        
        print(images)
        
//
//        let images = category.questions.map({$0.images.})
//
        do {
            try fileRepository.saveCategoryFile(category: category)
            
        } catch {
            
        }
    }
}
