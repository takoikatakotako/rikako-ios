import SwiftUI
import Combine

enum HomeViewFullScreenCover: Identifiable {
    case study(UUID, [Question])
    case review(UUID, [Question])
    var id: UUID {
        switch self {
        case let .study(id, _):
            return id
        case let .review(id, _):
            return id
        }
    }
}

enum HomeViewAlert: Identifiable {
    case questionEmpty(UUID)
    case message(UUID, String)
    var id: UUID {
        switch self {
        case let .questionEmpty(id) :
            return id
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
        
        do {
            let questions = try getUnsolvedQuestions()
            if questions.isEmpty {
                alert = .questionEmpty(UUID())
                return
            }
            sheet = .study(UUID(), questions)
        } catch {
            alert = .message(UUID(), error.localizedDescription)
        }
    }
    
    func reviewButtonTapped() {
        if userDefaultsRepository.getCategoryId() == nil {
            alert = .message(UUID(), "カテゴリーが選択されていません。")
            return
        }

        do {
            let questions = try getReviewQuestions()
            if questions.isEmpty {
                alert = .questionEmpty(UUID())
                return
            }
            sheet = .review(UUID(), questions)
        } catch {
            alert = .message(UUID(), error.localizedDescription)
        }
    }
    
    // 学習済みリストの問題を未学習に移す
    func solvedToUnsolved() {
        do {
            guard let categoryId = userDefaultsRepository.getCategoryId(),
                  var review = try? fileRepository.getReviewFile(name: Review.getFileName(categoryId: categoryId)) else {
                throw PublicCommonError.unknown
            }
            review.unsolvedQuestionIds = review.solvedQuestionIds
            review.solvedQuestionIds = []
            try fileRepository.saveReviewFile(review: review)
            setCategoryInfo()
        } catch {
            alert = .message(UUID(), error.localizedDescription)
        }
    }
            
    // 未学習問題を取得する
    private func getUnsolvedQuestions() throws -> [Question] {
        guard let categoryId = userDefaultsRepository.getCategoryId(),
              let review = try? fileRepository.getReviewFile(name: Review.getFileName(categoryId: categoryId)) else {
            throw PublicCommonError.unknown
        }
        let questionNumber = userDefaultsRepository.getQuestionNumber()
        let questionsIds = review.unsolvedQuestionIds.prefix(questionNumber)
        var questions: [Question] = []
        for questionId in questionsIds.shuffled() {
            if let question = try? fileRepository.getQuestionFile(name: Question.getFileName(questionId: questionId)) {
                questions.append(question)
            }
        }
        return questions
    }
    
    // 復習問題を取得する
    private func getReviewQuestions() throws -> [Question] {
        guard let categoryId = userDefaultsRepository.getCategoryId(),
              let review = try? fileRepository.getReviewFile(name: Review.getFileName(categoryId: categoryId)) else {
            throw PublicCommonError.unknown
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
