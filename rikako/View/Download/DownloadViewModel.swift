import SwiftUI
import Combine

class DownloadViewModel: ObservableObject {
    let jsonRepository = JsonRepository()
    let fileRepository = FileRepository()
    var subscriptions = Set<AnyCancellable>()
    private var imageCounter = 0


    @Published var showingAlert: Bool = false
    @Published var errorMessage: String = ""
    
    func download(categoryId: Int) {
        jsonRepository.fetchCategory(categoryId: categoryId)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    print(error)
                     self.showingAlert = true
                     self.errorMessage = error.localizedDescription
                    break
                }
            }, receiveValue: { category in
                self.saveFiles(category: category)
            })
            .store(in: &self.subscriptions)
    }
    
    private func saveFiles(category: Category) {
        do {
            
             try fileRepository.createDirectories()
            // カテゴリファイルを保存
            try fileRepository.saveCategoryFile(category: category)
            
            // 問題ファイルを保存
            for question in category.questions {
                try fileRepository.saveQuestionFile(question: question)
            }
            
            // 画像ファイルを保存
            var images: [String] = []
            for question in category.questions {
                for image in question.images {
                    images.append(image)
                }
            }
            if images.isEmpty {
                downloadComplate()
                return
            }
            
            imageCounter = images.count
            downloadImages(images: images)
        } catch {
            print(error)
        }
    }
    
    private func downloadImages(images: [String]) {
        for image in images {
            jsonRepository.downloadImage(imageName: image)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case let .failure(error):
                         self.showingAlert = true
                         self.errorMessage = error.localizedDescription
                        break
                    }
                }, receiveValue: { data in
                    try? self.fileRepository.saveImageFile(name: image, data: data)
                    self.imageCounter -= 1
                    if self.imageCounter == 0 {
                        self.downloadComplate()
                    }
                })
                .store(in: &self.subscriptions)
        }
    }
    

    private func downloadComplate() {
        
    }
}
