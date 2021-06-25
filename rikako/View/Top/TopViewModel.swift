import SwiftUI
import Combine

enum TopViewFullScreenCover: Identifiable {
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

enum TopViewAlert: Identifiable {
    case message(UUID, String)
    var id: UUID {
        switch self {
        case let .message(id, _):
            return id
        }
    }
}

class TopViewModel: ObservableObject {
    @Published var sheet: TopViewFullScreenCover? = nil
    @Published var alert: TopViewAlert? = nil
    @Published var categoryName: String = ""
    @Published var progressText: String = ""

    let fileRepository = FileRepository()
    let userDefaultsRepository = UserDefaultsRepository()
    
    func setCategoryInfo() {
        if let categoryId = userDefaultsRepository.getCategoryId(),
           let category = try? fileRepository.readCategoryFile(categoryId: categoryId) {
            categoryName = category.name
            progressText = "達成率2.3%"
        } else {
            categoryName = "カテゴリ未設定"
            progressText = ""
        }
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
              let category = try? fileRepository.readCategoryFile(categoryId: categoryId) else {
            return []
        }
        return Array(category.questions.shuffled().prefix(5))
    }
    
    func getReviewQuestions() -> [Question] {
        guard let categoryId = userDefaultsRepository.getCategoryId(),
              let category = try? fileRepository.readCategoryFile(categoryId: categoryId) else {
            return []
        }
        return Array(category.questions.shuffled().prefix(5))
    }
}
