import SwiftUI
import Combine

struct JsonRepository {
    func fetchMainCategory() -> AnyPublisher<[MainCategory], Error> {
        let url = URL(string: "https://rikako.jp/resource/categories/main-categories.json")!
         return URLSession.shared
             .dataTaskPublisher(for: url)
            .tryMap { try JSONDecoder().decode([MainCategory].self, from: $0.data) }
             .receive(on: DispatchQueue.main)
             .eraseToAnyPublisher()
    }
    
    func fetchSubCategories(fileName: String) -> AnyPublisher<[SubCategory], Error> {
        let url = URL(string: "https://rikako.jp/resource/categories/" + fileName)!
         return URLSession.shared
             .dataTaskPublisher(for: url)
            .tryMap { try JSONDecoder().decode(SubCategoriesResponse.self, from: $0.data).categories }
             .receive(on: DispatchQueue.main)
             .eraseToAnyPublisher()
    }
}
