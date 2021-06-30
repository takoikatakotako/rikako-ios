import Foundation

struct Review: Codable {
    let categoryId: Int
    var unsolvedQuestionIds: [Int]
    var missedQuestionIds: [Int]
    var solvedQuestionIds: [Int]
    
    init(categoryId: Int, unsolvedQuestions: [Int] = [], missedQuestions: [Int] = [], solvedQuestions: [Int] = []) {
        self.categoryId = categoryId
        self.unsolvedQuestionIds = unsolvedQuestions
        self.missedQuestionIds = missedQuestions
        self.solvedQuestionIds = solvedQuestions
    }
    
    static func getFileName(categoryId: Int) -> String {
        return "\(categoryId).json"
    }
}
