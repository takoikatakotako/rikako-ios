import Foundation

struct Category: Decodable, Identifiable {
    let categoryId: Int
    let name: String
    let questions: [Question]
    
    var id: Int {
        return categoryId
    }
}
