import Foundation

struct Category: Codable, Equatable, Identifiable {
    let categoryId: Int
    let name: String
    let questions: [Question]

    var id: Int {
        return categoryId
    }
    
    var fileName: String {
        return "\(categoryId).json"
    }
    
    static func getFileName(categoryId: Int) -> String {
        return "\(categoryId).json"
    }
}
