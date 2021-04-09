import Foundation

struct SubCategoriesResponse: Decodable {
    let categories: [SubCategory]
}

struct SubCategory: Decodable, Identifiable {
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

extension SubCategory {
    static func mock() -> SubCategory {
        return SubCategory(categoryId: 1, name: "小学校科学", image: "9.png")
    }
}
