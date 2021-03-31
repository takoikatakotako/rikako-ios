import SwiftUI

struct ResultView: View {
    let questions: [Question]
    let results: [Bool]
    @Binding var showingSheet: Bool

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                LazyVStack {
                    Text("結果")
                    Text("\(results.filter{$0}.count) / \(results.count)")
                    ForEach(questions) { question in
                        Text(question.text)
                        Divider()
                    }
                }
            }
            
            Button(action: {
                showingSheet = false
            }, label: {
                Text("トップに戻る")
                    .foregroundColor(Color.white)
                    .font(Font.system(size: 20).bold())
                    .frame(height: 60)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color("incorrectBlue"))
                    .padding(.horizontal, 8)
                    .cornerRadius(8)
            })
        }
        .navigationTitle("回答結果")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
}

struct ResultView_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State var showingSheet = true
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
