import Foundation

struct Config: Codable {
    var questionNumber: Int
    var categoryId: Int?
    
    static var fileName: String {
        return "config.json"
    }
}
