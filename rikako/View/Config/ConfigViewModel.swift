import Foundation

class ConfigViewModel: ObservableObject {
    @Published var questionNumber: Int = 5
    @Published var categoryId: Int? = 4
    let fileRepository = FileRepository()
    init() {

    }
}
