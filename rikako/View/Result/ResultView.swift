import SwiftUI

struct ResultView: View {
    let questions: [Question]
    let results: [Bool]
    @Binding var showingSheet: Bool

    var correctRate: Double {
        return Double(results.filter{$0}.count) / Double(results.count) * 100
    }
    
    var resultImageName: String {
        if correctRate == 100 {
            return "result-100per"
        } else if correctRate >= 80 {
            return "result-80per"
        } else if correctRate >= 60 {
            return "result-60per"
        } else if correctRate >= 40 {
            return "result-40per"
        } else {
            return "result-20per"
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                LazyVStack {
                    ZStack(alignment: .bottomTrailing) {
                        HStack {
                            Image(resultImageName)
                            Spacer()
                        }
                        VStack(alignment: .trailing) {
                            HStack(alignment: .bottom, spacing: 2) {
                                Text("正解率")
                                    .font(Font.system(size: 18).bold())
                                    .foregroundColor(Color("reaultColor-60per"))

                                Text(String(format: "%.1f", correctRate))
                                    .font(Font.system(size: 36).bold())
                                    .foregroundColor(Color("reaultColor-60per"))

                                Text("%")
                                    .font(Font.system(size: 18).bold())
                                    .foregroundColor(Color("reaultColor-60per"))
                            }
                            Text("\(results.filter{$0}.count)問/\(results.count)問")
                                .font(Font.system(size: 18))
                                .foregroundColor(Color("textGray"))
                        }
                    }
                    .padding(8)

                    ForEach(Array(zip(questions.indices, questions)), id: \.0) { index, question in
                        Divider()
                        HStack(spacing: 4) {
                            if results[index] {
                                Image("result-correct")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .opacity(0.4)
                            } else {
                                Image("result-discorrect")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .opacity(0.4)
                            }
                            
                            Text(question.text)
                                .font(Font.system(size: 16))
                                .foregroundColor(Color("textGray"))
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            Image("result-next")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .opacity(0.4)
                        }
                        .padding(.leading, 8)
                        .padding(.trailing, 4)
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
