import Foundation

struct CategoryInfo: Decodable, Identifiable {
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

extension CategoryInfo {
    static func mock() -> CategoryInfo {
        return CategoryInfo(categoryId: 1, name: "小学校科学", image: "9.png")
    }
}
