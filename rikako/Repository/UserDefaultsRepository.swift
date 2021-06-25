import Foundation

struct UserDefaultsRepository {
    static let ALLOW_PENCIL_INPUT = "ALLOW_PENCIL_INPUT"
    
    static let QUESTION_NUMBER = "QUESTION_NUMBER"
    static let CATEGORY_ID = "CATEGORY_ID"

    func initialize() throws {
        
    }
    
    func setQuestionNumber(questionNumber: Int) {
        UserDefaults.standard.set(questionNumber, forKey: Self.QUESTION_NUMBER)
    }
    
    func getQuestionNumber() -> Int {
        guard let questionNumber = UserDefaults.standard.object(forKey: Self.QUESTION_NUMBER) as? Int else {
            return 5
        }
        return questionNumber
    }
    
    func setCategoryId(categoryId: Int) {
        UserDefaults.standard.set(categoryId, forKey: Self.CATEGORY_ID)
    }
    
    func getCategoryId() -> Int? {
        return UserDefaults.standard.object(forKey: Self.CATEGORY_ID) as? Int
    }
    
    func reset() {
        UserDefaults.standard.set(nil, forKey: Self.QUESTION_NUMBER)
        UserDefaults.standard.set(nil, forKey: Self.CATEGORY_ID)
    }
}
