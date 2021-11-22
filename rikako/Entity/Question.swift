import Foundation

struct Question: Identifiable, Codable, Equatable {
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
    let tags: [String]

    var fileName: String {
        return "\(questionId).json"
    }
    
    static func getFileName(questionId: Int) -> String {
        return "\(questionId).json"
    }
    
    static func mock() -> Question {
        Question(questionId: 1, text: "植物が光合成をするとき、何をすって酸素を出しますか。", images: [], answer: 2, answers: ["ちっそ", "二酸化炭素", "水素", "酸素"], comment: "光合成は二酸化炭素をすって酸素を出します。", commentImages: [], tags: [])
    }
    
    static func mock(questionId: Int) -> Question {
        Question(questionId: questionId, text: "植物が光合成をするとき、何をすって酸素を出しますか。", images: [], answer: 2, answers: ["ちっそ", "二酸化炭素", "水素", "酸素"], comment: "光合成は二酸化炭素をすって酸素を出します。", commentImages: [], tags: [])
    }
}
