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
                        destination: QuestionAnswer(question: question),
                        label: {
                            ResultListRow(result: results[index], text: question.text)
                        })
                }
                // TODO: コードでもう少し厳密にする。計算する。 Scroll + LazyVStack もありかも
                // https://stackoverflow.com/questions/56553672/how-to-remove-the-line-separators-from-a-list-in-swiftui-without-using-foreach
                if questions.count > 5 {
                    Text("")
                        .padding(.bottom, 60)
                    
                }
                
            }
            .listStyle(PlainListStyle())
            
            Button(action: {
                save()
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
            .padding(.bottom, 8)
        }
        .navigationTitle("回答結果")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
    
    private func save() {
        let fileRepository = FileRepository()
        guard let categoryId = UserDefaultsRepository().getCategoryId(),
              var review = try? fileRepository.getReviewFile(name: Review.getFileName(categoryId: categoryId)) else {
            return
        }
        for (index, result) in results.enumerated() {
            let questionId = questions[index].id
            // 未学習から削除
            if let index = review.unsolvedQuestionIds.firstIndex(of: questionId) {
                review.unsolvedQuestionIds.remove(at: index)
            }
            if result {
                // 学習済みに追加
                review.solvedQuestionIds.append(questionId)
            } else {
                // 要復習に追加
                review.missedQuestionIds.append(questionId)
            }
        }
        try? fileRepository.saveReviewFile(review: review)
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
