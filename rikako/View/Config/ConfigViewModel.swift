import Foundation

class ConfigViewModel: ObservableObject {
    @Published var questionNumber: Int
    @Published var categoryId: Int?
    let fileRepository = FileRepository()
    init() {
        let config = try! fileRepository.readConfigFile()
        questionNumber = config.questionNumber
        categoryId = config.categoryId
    }
}
