import SwiftUI
import Combine

class DownloadViewModel: ObservableObject {
    private let categoryId: Int
    private var downloadUseCase = DownloadUseCase()
    private var categoryUseCase = CategoryUseCase()
    
    @Published var message: String = "リソースをダウンロードしています"
    @Published var doneDownload: Bool = false
    
    init(categoryId: Int) {
        self.categoryId = categoryId
    }

    func download() {
        downloadUseCase.download(categoryId: categoryId) { [weak self] result in
            switch result {
            case .success():
                self?.downloadComplate()
            case let .failure(error):
                self?.message = error.localizedDescription
                self?.doneDownload = true
            }
        }
    }
    
    //
    private func downloadComplate() {
        do {
            try categoryUseCase.selectCategory(categoryId: categoryId)
        } catch {
            self.message = error.localizedDescription
            self.doneDownload = true
            return
        }
        self.message = "ダウンロード無事完了！"
        self.doneDownload = true
    }
}
