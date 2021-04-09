import SwiftUI
import Combine

struct JsonRepository {
    func fetchMainCategory() -> AnyPublisher<[MainCategory], Error> {
        let url = URL(string: "https://rikako.jp/resource/categories/main-categories.json")!
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { try JSONDecoder().decode([MainCategory].self, from: $0.data) }
            .eraseToAnyPublisher()
    }
    
    func fetchSubCategories(fileName: String) -> AnyPublisher<[SubCategory], Error> {
        let url = URL(string: "https://rikako.jp/resource/categories/" + fileName)!
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { try JSONDecoder().decode(SubCategoriesResponse.self, from: $0.data).categories }
            .eraseToAnyPublisher()
    }
    
    func fetchCategory(categoryId: Int) -> AnyPublisher<Category, Error> {
        let url = URL(string: "https://rikako.jp/resource/categories/\(categoryId).json")!
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { try JSONDecoder().decode(Category.self, from: $0.data) }
            .eraseToAnyPublisher()
    }
}
