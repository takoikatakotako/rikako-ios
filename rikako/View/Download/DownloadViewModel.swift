import SwiftUI
import Combine

class DownloadViewModel: ObservableObject {
    let categoryId: Int
    let jsonRepository = JsonRepository()
    let fileRepository = FileRepository()
    var subscriptions = Set<AnyCancellable>()
    private var imageCounter = 0

    @Published var message: String = "リソースをダウンロードしています"
    @Published var doneDownload: Bool = false
    
    init(categoryId: Int) {
        self.categoryId = categoryId
    }

    func download() {
        jsonRepository.fetchCategory(categoryId: categoryId)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    print(error)
                    self.message = error.localizedDescription
                    self.doneDownload = true
                    break
                }
            }, receiveValue: { category in
                self.saveFiles(category: category)
            })
            .store(in: &self.subscriptions)
    }
    
    private func saveFiles(category: Category) {
        do {
            
             try fileRepository.initialize()
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
            self.message = error.localizedDescription
            self.doneDownload = true
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
                        self.message = error.localizedDescription
                        self.doneDownload = true
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
        
        do {
            var config = try fileRepository.readConfigFile()
            config.categoryId = categoryId
            try fileRepository.saveConfigFile(config: config)
        } catch {
            self.message = error.localizedDescription
            self.doneDownload = true
            return
        }
        
        self.message = "ダウンロード無事完了！"
        self.doneDownload = true
    }
}
