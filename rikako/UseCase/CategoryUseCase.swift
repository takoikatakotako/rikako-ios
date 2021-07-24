import Foundation

class CategoryUseCase {
    private let fileRepository = FileRepository()
    private let userDefaultsRepository = UserDefaultsRepository()
    
    func selectCategory(categoryId: Int) throws {
        userDefaultsRepository.setCategoryId(categoryId: categoryId)
        // TODO: データを作り直しているのでデータは消さないようにしたい
        var review: Review = Review(categoryId: categoryId)
        let category = try fileRepository.getCategoryFile(categoryId: categoryId)
        let categoryQuestionIds = category.questions.map { $0.id }
        review.unsolvedQuestionIds = Set(categoryQuestionIds)
        try fileRepository.saveReviewFile(review: review)
    }
}
