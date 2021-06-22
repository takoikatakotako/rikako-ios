import SwiftUI
import AVKit

class QuestionViewModel: ObservableObject {
    @Published var question: Question
    @Published var showingModal = false
    @Published var showingResultImage: Bool?
    @Published var buttonDisabled: Bool = false
    @Published var results: [Bool] = []
    @Published var goReultView = false
    @Published var showingAlert = false
    
    init(questions: [Question]) {
        self.questions = questions
        self.questionIndex = 0
        self.question = questions[questionIndex]
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
            
            let sound = NSDataAsset(name: "correct")!
            audioPlayer = try? AVAudioPlayer(data: sound.data)
            audioPlayer?.play()
        } else {
            // 不正解
            results.append(false)
            showingResultImage = false
            
            let sound = NSDataAsset(name: "discorrect")!
            audioPlayer = try? AVAudioPlayer(data: sound.data)
            audioPlayer?.play()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.showingResultImage = nil
            if self.questionIndex < self.questions.count - 1 {
                self.questionIndex += 1
                self.question = self.questions[self.questionIndex]
                self.buttonDisabled = false
            } else {
                self.goReultView = true
            }
        }
    }
    
    
    func showCloaseConfirmAlert() {
        showingAlert = true
    }
}
