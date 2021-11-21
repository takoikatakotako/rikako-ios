import SwiftUI
import Combine

enum SubCategoryViewAlert: Identifiable {
    case select(Int, String)
    var id: Int {
        switch self {
        case let .select(categoryId, _):
            return categoryId
        }
    }
}

enum SubCategoryViewFullScreen: Identifiable {
    case download(Int)
    var id: Int {
        categoryId
    }
    
    var categoryId: Int {
        switch self {
        case let .download(categoryId):
            return categoryId
        }
    }
}

class CategoriesViewModel: ObservableObject {
    private let jsonRepository = JsonRepository()
    private let userDefaultsRepository = UserDefaultsRepository()
    var subscriptions = Set<AnyCancellable>()
    @Published var subCategories: [SubCategory] = []
    @Published var alert: SubCategoryViewAlert?
    @Published var fullScreen: SubCategoryViewFullScreen?
    @Published var selectedCategoryId: Int?
    
    init() {
        selectedCategoryId = userDefaultsRepository.getCategoryId()
    }
    
    func fetchSubCategories(fileName: String) {
        jsonRepository.fetchSubCategories(fileName: fileName)
        .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case let .failure(error):
                print(error)
                // self.showingAlert = true
                // self.errorMessage = error.localizedDescription
                break
            }
        }, receiveValue: { subCategories in
            DispatchQueue.main.async {
                self.subCategories = subCategories
            }
        })
        .store(in: &self.subscriptions)
    }
    
    func categoryTapped(subCategory: SubCategory) {
        alert = .select(subCategory.categoryId, subCategory.name)
    }
    
    func downloadCategory(categoryId: Int) {
        fullScreen = .download(categoryId)
    }
    
    func updateSelectedCategoryId() {
        selectedCategoryId = userDefaultsRepository.getCategoryId()
    }
}