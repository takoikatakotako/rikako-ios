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

class TopViewModel: ObservableObject {
    @Published var showingQuestionSheet: TopViewFullScreenCover? = nil
    let fileRepository = FileRepository()
    
    func studyButtonTapped() {
        showingQuestionSheet = .study
    }
    
    func reviewButtonTapped() {
        showingQuestionSheet = .review
    }
    
    func getStudyQuestions() -> [Question] {
        do {
            let config = try fileRepository.readConfigFile()
            guard let categoryId = config.categoryId else {
                throw PublicFileError.failToSaveCategory
            }
            let category = try fileRepository.readCategoryFile(categoryId: categoryId)
            return Array(category.questions.shuffled().prefix(5))
        } catch {
            return []
        }
    }
    
    func getReviewQuestions() -> [Question] {
        do {
            let config = try fileRepository.readConfigFile()
            guard let categoryId = config.categoryId else {
                throw PublicFileError.failToSaveCategory
            }
            let category = try fileRepository.readCategoryFile(categoryId: categoryId)
            return Array(category.questions.shuffled().prefix(5))
        } catch {
            return []
        }
    }
    
}
