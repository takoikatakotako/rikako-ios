import Foundation

enum ConfigViewAlert: Identifiable {
    case reset
    var id: Int {
        self.hashValue
    }
}

class ConfigViewModel: ObservableObject {
    @Published var questionNumber: Int = 5
    @Published var categoryId: Int? = 4
    @Published var alert: ConfigViewAlert?
    
    let fileRepository = FileRepository()
    let userDefaultsRepository = UserDefaultsRepository()
    init() {
        questionNumber = userDefaultsRepository.getQuestionNumber()
        categoryId = userDefaultsRepository.getCategoryId()
    }
    
    func resetButtonTapped() {
        alert = .reset
    }
    
    func reset() {
        userDefaultsRepository.reset()
    }
}
