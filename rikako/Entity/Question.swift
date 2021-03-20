import Foundation

struct Question: Identifiable, Decodable {
    var id: Int {
        return questionId
    }
    let questionId: Int
    let text: String
    let images: [String]
    let answer: Int
    let answers: [String]
    let comment: String
    let commentImages: [String]
    
    static func mock() -> Question {
        Question(questionId: 1, text: "sss", images: [], answer: 3, answers: [], comment: "ss", commentImages: [])
    }
}
