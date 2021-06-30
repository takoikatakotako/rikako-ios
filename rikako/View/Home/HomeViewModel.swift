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
    @Published var reviewText: String = ""
    @Published var studyText: String = ""

    let fileRepository = FileRepository()
    let userDefaultsRepository = UserDefaultsRepository()
    var questionNumber: Int
    
    init() {
        questionNumber = userDefaultsRepository.getQuestionNumber()
    }
    
    func setCategoryInfo() {
        if let categoryId = userDefaultsRepository.getCategoryId(),
           let category = try? fileRepository.getCategoryFile(categoryId: categoryId),
           let review = try? fileRepository.getReviewFile(name: Review.getFileName(categoryId: categoryId)) {
            categoryName = category.name            
            // 進捗率
            if review.unsolvedQuestionIds.count == 0 {
                progressText = "達成率100%"
            } else {
                let progressRate = Float(review.solvedQuestionIds.count) / Float(category.questions.count) * 100
                progressText = "達成率\(String(format:"%.1f", progressRate))%"
            }
            reviewText = "復習(\(review.missedQuestionIds.count))"
            studyText = "未学習(\(review.unsolvedQuestionIds.count))"
        } else {
            categoryName = "カテゴリ未設定"
            progressText = ""
            reviewText = "復習"
            studyText = "未学習"
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
        guard let categoryId = userDefaultsRepository.getCategoryId() else {
            alert = .message(UUID(), "カテゴリーが選択されていません。")
            return
        }
        guard let  review =  try? fileRepository.getReviewFile(name: Review.getFileName(categoryId: categoryId)),
              review.missedQuestionIds.count != 0 else {
            alert = .message(UUID(), "復習問題ありません。")
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
              let review = try? fileRepository.getReviewFile(name: Review.getFileName(categoryId: categoryId)) else {
            return []
        }
        var questions: [Question] = []
        for questionId in review.missedQuestionIds.prefix(questionNumber) {
            if let question = try? fileRepository.getQuestionFile(name: Question.getFileName(questionId: questionId)) {
                questions.append(question)
            }
        }        
        return Array(questions.shuffled().prefix(questionNumber))
    }
}
