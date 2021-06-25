import SwiftUI

struct ResultView: View {
    let questions: [Question]
    let results: [Bool]
    @Binding var showingSheet: HomeViewFullScreenCover?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            List {
                ResultListHeader(results: results)
                
                ForEach(Array(zip(questions.indices, questions)), id: \.0) { index, question in
                    NavigationLink(
                        destination: QuestionDetailView(question: question),
                        label: {
                            ResultListRow(result: results[index], text: question.text)
                        })
                }
            }
            .listStyle(PlainListStyle())
            
            Button(action: {
                showingSheet = nil
            }, label: {
                Text("トップに戻る")
                    .foregroundColor(Color.white)
                    .font(Font.system(size: 20).bold())
                    .frame(height: 60)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color("incorrectBlue"))
                    .padding(.horizontal, 8)
                    .cornerRadius(16)
            })
        }
        .navigationTitle("回答結果")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
}

struct ResultView_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State var showingSheet: HomeViewFullScreenCover? = .study
        var body: some View {
            ResultView(
                questions: [Question.mock(questionId: 1), Question.mock(questionId: 2), Question.mock(questionId: 3)],
                results: [true, false, true],
                showingSheet: $showingSheet)
        }
    }
    
    static var previews: some View {
        NavigationView {
            PreviewWrapper()
        }
    }
}
