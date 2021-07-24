import Foundation

struct UserDefaultsRepository {
    static let DONE_TUTORIAL = "DONE_TUTORIAL"
    static let QUESTION_NUMBER = "QUESTION_NUMBER"
    static let CATEGORY_ID = "CATEGORY_ID"
    static let SOUND_ENABLE = "SOUND_ENABLE"
    static let VIB_ENABLE = "VIB_ENABLE"

    func initialize() throws {
        
    }
    
    // DoneTutorial
    func setDoneTutorial(doneTutorial: Bool) {
        UserDefaults.standard.set(doneTutorial, forKey: Self.DONE_TUTORIAL)
    }
    
    func getDoneTutorial() -> Bool {
        return UserDefaults.standard.bool(forKey: Self.DONE_TUTORIAL)
    }
    
    // QuestionNumber
    func setQuestionNumber(questionNumber: Int) {
        UserDefaults.standard.set(questionNumber, forKey: Self.QUESTION_NUMBER)
    }
    
    func getQuestionNumber() -> Int {
        guard let questionNumber = UserDefaults.standard.object(forKey: Self.QUESTION_NUMBER) as? Int else {
            return 5
        }
        return questionNumber
    }
    
    // CategoryId
    func setCategoryId(categoryId: Int) {
        UserDefaults.standard.set(categoryId, forKey: Self.CATEGORY_ID)
    }
    
    func getCategoryId() -> Int? {
        return UserDefaults.standard.object(forKey: Self.CATEGORY_ID) as? Int
    }
    
    // SoundEnable
    func setSoundEnable(enable: Bool) {
        UserDefaults.standard.set(enable, forKey: Self.SOUND_ENABLE)
    }
    
    func getSoundEnable() -> Bool {
        guard let enable = UserDefaults.standard.object(forKey: Self.SOUND_ENABLE) as? Bool else {
            return true
        }
        return enable
    }
    
    // VibEnable
    func setVibEnable(enable: Bool) {
        UserDefaults.standard.set(enable, forKey: Self.VIB_ENABLE)
    }
    
    func getVibEnable() -> Bool {
        guard let enable = UserDefaults.standard.object(forKey: Self.VIB_ENABLE) as? Bool else {
            return true
        }
        return enable
    }
    
    func reset() {
        UserDefaults.standard.set(nil, forKey: Self.QUESTION_NUMBER)
        UserDefaults.standard.set(nil, forKey: Self.CATEGORY_ID)
    }
}
