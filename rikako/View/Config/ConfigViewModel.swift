import Foundation

enum ConfigViewAlert: Identifiable {
    case reset
    var id: Int {
        self.hashValue
    }
}

class ConfigViewModel: ObservableObject {
    @Published var alert: ConfigViewAlert?
    @Published var questionNumber: Int
    @Published var categoryName: String
    
    let fileRepository = FileRepository()
    let userDefaultsRepository = UserDefaultsRepository()
    init() {
        questionNumber = userDefaultsRepository.getQuestionNumber()
        if let categoryId = userDefaultsRepository.getCategoryId(),
           let category = try? fileRepository.readCategoryFile(categoryId: categoryId) {
            self.categoryName = category.name
        } else {
            self.categoryName = "未設定"
        }
    }
    
    func resetButtonTapped() {
        alert = .reset
    }
    
    func reset() {
        userDefaultsRepository.reset()
    }
}
