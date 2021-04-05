import Foundation

struct MainCategory: Decodable, Identifiable {
    let name: String
    let image: String
    let subCategoryName: String
    
    var id: String {
        return name
    }
    
    var imagePath: String {
        return "https://rikako.jp/resource/images/" + image
    }
}

extension MainCategory {
    static func mock() -> MainCategory {
        return MainCategory(name: "化学", image: "7.png", subCategoryName: "chemistry-categories.json")
    }
}
