import SwiftUI

struct QuestionDetailView: View {
    let question: Question
    var body: some View {
        ScrollView {
            VStack {
                Text(question.text)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding()
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            
            Image("tutorial-screen1")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.black)
            
            Image("tutorial-screen1")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.black)
        }
        .navigationBarTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct QuestionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            QuestionDetailView(question: Question.mock())
        }
    }
}
