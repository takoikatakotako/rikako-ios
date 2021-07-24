import Combine

//TODO: エラーハンドリング周りをちゃんとする。
class DownloadUseCase {
    private let jsonRepository = JsonRepository()
    private let fileRepository = FileRepository()
    private var subscriptions = Set<AnyCancellable>()
    private var imageCounter = 0
    
    func download(categoryId: Int, completion: @escaping (Result<Void, Error>) -> Void) {
        jsonRepository.fetchCategory(categoryId: categoryId)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    print(error)
                    break
                }
            }, receiveValue: {category in
                do {
                    try self.saveFiles(category: category)
                    completion(.success(()))
                } catch {
                    completion(.failure(error))
                }
            })
            .store(in: &self.subscriptions)
    }
    
    private func saveFiles(category: Category) throws {
        // カテゴリファイルを保存
        try fileRepository.saveCategoryFile(category: category)
        
        // 問題ファイルバラバラにして保存
        for question in category.questions {
            try fileRepository.saveQuestionFile(question: question)
        }
        
        // 画像ファイルを保存
        var images: [String] = []
        for question in category.questions {
            for image in question.images {
                images.append(image)
            }
            for commentImage in question.commentImages {
                images.append(commentImage)
            }
        }
        if images.isEmpty {
            return
        }
        
        imageCounter = images.count
        downloadImages(images: images)
    }
    
    private func downloadImages(images: [String]) {
        for image in images {
            jsonRepository.downloadImage(imageName: image)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case let .failure(error):
                        print(error)
                        break
                    }
                }, receiveValue: { data in
                    try? self.fileRepository.saveImageFile(name: image, data: data)
                    self.imageCounter -= 1
                    if self.imageCounter == 0 {
                        return
                    }
                })
                .store(in: &self.subscriptions)
        }
    }
}
