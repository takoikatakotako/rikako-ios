import Foundation

struct Config: Codable {
    var categoryId: Int?
    
    static var fileName: String {
        return "config.json"
    }
}
