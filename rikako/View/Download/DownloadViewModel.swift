import SwiftUI
import Combine

class DownloadViewModel: ObservableObject {
    let jsonRepository = JsonRepository()
    let fileRepository = FileRepository()
    var subscriptions = Set<AnyCancellable>()
    private var imageCounter = 0
    
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
        do {
            // TODO: 本当は画像を保存した後にした方が良さそう
            try fileRepository.saveCategoryFile(category: category)
            var images: [String] = []
            for question in category.questions {
                for image in question.images {
                    images.append(image)
                }
            }
            imageCounter = images.count
            downloadImages(images: images)
        } catch {
            
        }
    }
    
    // TODO: ハンドリング
    func downloadImages(images: [String]) {
        for image in images {
            jsonRepository.downloadImage(imageName: image)
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
                }, receiveValue: { data in
                    self.saveImage(image: image, imageData: data)
                    self.imageCounter -= 1
                    if self.imageCounter == 0 {
                        
                    }
                })
                .store(in: &self.subscriptions)
        }
    }
    
    //
    func saveImage(image: String, imageData: Data) {
        try? fileRepository.saveImageFile(name: image, data: imageData)
    }
}
