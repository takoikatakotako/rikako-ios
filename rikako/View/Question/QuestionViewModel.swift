import SwiftUI
import AVKit
import AudioToolbox

enum QuestionViewSheet: Identifiable {
    case question(UUID, Question)
    case image(UUID, String)
    case answer(UUID, Question)
    var id: UUID {
        switch self {
        case let .question(id, _):
            return id
        case let .image(id, _):
            return id
        case let .answer(id, _):
            return id
        }
    }
}

class QuestionViewModel: ObservableObject {
    @Published var question: Question
    @Published var showingResultImage: Bool?
    @Published var buttonDisabled: Bool = false
    @Published var results: [Bool] = []
    @Published var goReultView = false
    @Published var showingAlert = false
    @Published var sheet: QuestionViewSheet?
    let soundOn: Bool
    let vibOn: Bool
    let fileRepository = FileRepository()
    let userDefaultsRepository = UserDefaultsRepository()
    
    init(questions: [Question]) {
        self.questions = questions
        self.questionIndex = 0
        self.question = questions[questionIndex]
        soundOn = userDefaultsRepository.getSoundEnable()
        vibOn = userDefaultsRepository.getVibEnable()
    }
    
    var audioPlayer: AVAudioPlayer?
    let questions: [Question]
    var questionIndex: Int
    
    func selectedAnswer(answer: String) {
        self.buttonDisabled = true
        if answer == question.answers[question.answer] {
            // 正解
            results.append(true)
            showingResultImage = true
            sound(correct: true)
        } else {
            // 不正解
            results.append(false)
            showingResultImage = false
            sound(correct: false)
            vib()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.showingResultImage = nil
            self.nextQuestion()
        }
    }
    
    func skip() {
        // 不正解
        self.buttonDisabled = true
        results.append(false)
        nextQuestion()
    }
    
    
    func getUIImage(name: String) -> UIImage? {
        guard let imageData = try? fileRepository.getImageFile(name: name) else {
            return nil
        }
        return UIImage(data: imageData)
    }
    
    func showQuestionSheet() {
        sheet = .question(UUID(), question)
    }
    
    func showAnserSheet() {
        sheet = .answer(UUID(), question)
    }
    
    func showImageViewerSheet(image: String) {
        sheet = .image(UUID(), image)
    }
    
    func showCloaseConfirmAlert() {
        showingAlert = true
    }
    
    private func nextQuestion() {
        if self.questionIndex < self.questions.count - 1 {
            self.questionIndex += 1
            self.question = self.questions[self.questionIndex]
            self.buttonDisabled = false
        } else {
            self.goReultView = true
        }
    }
    
    private func sound(correct: Bool) {
        guard soundOn else {
            return
        }
        
        let fileName = correct ? "correct" : "discorrect"
        guard let sound = NSDataAsset(name: fileName) else {
            return
        }
        audioPlayer = try? AVAudioPlayer(data: sound.data)
        audioPlayer?.play()
    }
    
    private func vib() {
        guard vibOn else {
            return
        }
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
}
