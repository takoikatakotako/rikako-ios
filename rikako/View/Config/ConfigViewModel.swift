import Foundation

enum ConfigViewSheet: Identifiable {
    case questionNumber
    var id: Int {
        self.hashValue
    }
}

enum ConfigViewAlert: Identifiable {
    case reset
    var id: Int {
        self.hashValue
    }
}

class ConfigViewModel: ObservableObject {
    @Published var sheet: ConfigViewSheet?
    @Published var alert: ConfigViewAlert?
    @Published var questionNumber: Int
    @Published var categoryName: String
    @Published var soundOn: Bool {
        didSet {
            setConfigs()
        }
    }
    @Published var vibOn: Bool {
        didSet {
            setConfigs()
        }
    }
    
    let fileRepository = FileRepository()
    let userDefaultsRepository = UserDefaultsRepository()
    init() {
        questionNumber = userDefaultsRepository.getQuestionNumber()
        if let categoryId = userDefaultsRepository.getCategoryId(),
           let category = try? fileRepository.getCategoryFile(categoryId: categoryId) {
            self.categoryName = category.name
        } else {
            self.categoryName = "未設定"
        }
        soundOn = userDefaultsRepository.getSoundEnable()
        vibOn = userDefaultsRepository.getVibEnable()
    }
    
    func questionNumberTapped() {
        sheet = .questionNumber
    }
    
    func reviewButtonTapped() {
        
    }
    
    func twitterButtonTapped() {
        
    }
    
    func resetButtonTapped() {
        alert = .reset
    }
    
    func setConfigs() {
        userDefaultsRepository.setQuestionNumber(questionNumber: questionNumber)
        userDefaultsRepository.setSoundEnable(enable: soundOn)
        userDefaultsRepository.setVibEnable(enable: vibOn)
    }
    
    func updateConfigs() {
        questionNumber = userDefaultsRepository.getQuestionNumber()
        if let categoryId = userDefaultsRepository.getCategoryId(),
           let category = try? fileRepository.getCategoryFile(categoryId: categoryId) {
            self.categoryName = category.name
        } else {
            self.categoryName = "未設定"
        }
        soundOn = userDefaultsRepository.getSoundEnable()
        vibOn = userDefaultsRepository.getVibEnable()
    }
    
    func reset() {
        userDefaultsRepository.reset()
    }
}
