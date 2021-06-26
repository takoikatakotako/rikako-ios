import SwiftUI

struct QuestionAnswer: View {
    let question: Question
    var body: some View {
        Text("QuestionAnswer")
    }
}

struct QuestionAnswer_Previews: PreviewProvider {
    static var previews: some View {
        QuestionAnswer(question: Question.mock())
    }
}
