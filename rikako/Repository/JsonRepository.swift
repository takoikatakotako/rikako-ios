import SwiftUI
import Combine

struct JsonRepository {
    // CategoryInfoを取得する
    func fetchCategoryInfos(fileName: String) -> AnyPublisher<[CategoryInfo], Error> {
        let url = URL(string: "https://rikako.jp/resource/categories/" + fileName)!
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { try JSONDecoder().decode(CategoryInfos.self, from: $0.data).categories }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    // Categoryを取得する
    func fetchCategory(categoryId: Int) -> AnyPublisher<Category, Error> {
        let url = URL(string: "https://rikako.jp/resource/categories/\(categoryId).json")!
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { try JSONDecoder().decode(Category.self, from: $0.data) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func downloadImage(imageName: String) -> AnyPublisher<Data, Error> {
        let url = URL(string: "https://rikako.jp/resource/images/\(imageName)")!
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { $0.data }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
