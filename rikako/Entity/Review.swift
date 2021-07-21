import Foundation

struct Review: Codable {
    let categoryId: Int
    var unsolvedQuestionIds: Set<Int>
    var missedQuestionIds: Set<Int>
    var solvedQuestionIds: Set<Int>
    
    init(categoryId: Int, unsolvedQuestions:  Set<Int> = [], missedQuestions: Set<Int> = [], solvedQuestions:  Set<Int> = []) {
        self.categoryId = categoryId
        self.unsolvedQuestionIds = unsolvedQuestions
        self.missedQuestionIds = missedQuestions
        self.solvedQuestionIds = solvedQuestions
    }
    
    static func getFileName(categoryId: Int) -> String {
        return "\(categoryId).json"
    }
}
