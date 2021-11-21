import Foundation

struct CategoryResponse: Decodable, Identifiable {
    let categoryId: Int
    let name: String
    let image: String
    
    var id: Int {
        return categoryId
    }
    
    var imagePath: String {
        return "https://rikako.jp/resource/images/" + image
    }
}

extension CategoryResponse {
    static func mock() -> CategoryResponse {
        return CategoryResponse(categoryId: 1, name: "小学校科学", image: "9.png")
    }
}
