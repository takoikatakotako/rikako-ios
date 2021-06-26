import SwiftUI
import Combine

enum HomeViewFullScreenCover: Identifiable {
    case study
    case review
    var id: Int {
        switch self {
        case .study:
            return self.hashValue
        case .review:
            return self.hashValue
        }
    }
}

enum HomeViewAlert: Identifiable {
    case message(UUID, String)
    var id: UUID {
        switch self {
        case let .message(id, _):
            return id
        }
    }
}

class HomeViewModel: ObservableObject {
    @Published var sheet: HomeViewFullScreenCover? = nil
    @Published var alert: HomeViewAlert? = nil
    @Published var categoryName: String = ""
    @Published var progressText: String = ""

    let fileRepository = FileRepository()
    let userDefaultsRepository = UserDefaultsRepository()
    var questionNumber: Int
    
    init() {
        questionNumber = userDefaultsRepository.getQuestionNumber()
    }
    
    func setCategoryInfo() {
        if let categoryId = userDefaultsRepository.getCategoryId(),
           let category = try? fileRepository.getCategoryFile(categoryId: categoryId) {
            categoryName = category.name
            progressText = "達成率2.3%"
        } else {
            categoryName = "カテゴリ未設定"
            progressText = ""
        }
        questionNumber = userDefaultsRepository.getQuestionNumber()
    }
    
    func studyButtonTapped() {
        if userDefaultsRepository.getCategoryId() == nil {
            alert = .message(UUID(), "カテゴリーが選択されていません。")
            return
        }
        sheet = .study
    }
    
    func reviewButtonTapped() {
        if userDefaultsRepository.getCategoryId() == nil {
            alert = .message(UUID(), "カテゴリーが選択されていません。")
            return
        }
        sheet = .review
    }
    
    func getStudyQuestions() -> [Question] {
        guard let categoryId = userDefaultsRepository.getCategoryId(),
              let category = try? fileRepository.getCategoryFile(categoryId: categoryId) else {
            return []
        }
        return Array(category.questions.shuffled().prefix(questionNumber))
    }
    
    func getReviewQuestions() -> [Question] {
        guard let categoryId = userDefaultsRepository.getCategoryId(),
              let category = try? fileRepository.getCategoryFile(categoryId: categoryId) else {
            return []
        }
        return Array(category.questions.shuffled().prefix(questionNumber))
    }
}
