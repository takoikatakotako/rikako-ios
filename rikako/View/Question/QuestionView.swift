import SwiftUI

struct QuestionView: View {
    @StateObject var viewModel: QuestionViewModel
    @Binding var showingSheet: Bool

    init(questinos: [Question], showingSheet: Binding<Bool>) {
        _viewModel = StateObject(wrappedValue: QuestionViewModel(questions: questinos))
        self._showingSheet = showingSheet
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 8) {
                ZStack {
                    Button(action: {
                        viewModel.showingModal = true
                    }) {
                        VStack {
                            Text(viewModel.question.text)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                                .padding()
                            Spacer()
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button(action: {
                                viewModel.showingModal = true
                            }, label: {
                                Text("答えを見る")
                                    .foregroundColor(Color.white)
                                    .font(Font.system(size: 16).bold())
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(Color("correctPink"))
                                    .cornerRadius(4)
                            })
                            .padding(.horizontal, 8)
                        }
                        
                        HStack {
                            ForEach(viewModel.question.images, id: \.self) { image in
                                Image("tutorial-screen1")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 90, height: 90)
                                    .background(Color.black)
                            }
                        }
                    }
                }
                
                ForEach(viewModel.question.answers, id: \.self) { answer in
                    QuestionButton(text: answer) {
                        viewModel.selectedAnswer(answer: answer)
                    }
                    .disabled(viewModel.buttonDisabled)
                }

                Text("Admob")
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color.gray)
            }
            
            if viewModel.showingResultImage == true {
                Image(R.image.questionCorrect.name)
                    .resizable()
                    .scaledToFit()
            } else if viewModel.showingResultImage == false {
                Image(R.image.questionDiscorrect.name)
                    .resizable()
                    .scaledToFit()
            }
            
            NavigationLink(
                destination: ResultView(questions: viewModel.questions, results: viewModel.results, showingSheet: $showingSheet),
                isActive: $viewModel.goReultView,
                label: {
                    EmptyView()
                })
        }
        .sheet(isPresented: $viewModel.showingModal) {
            QuestionDetailView(text: "ssssssssss")
        }
        .navigationBarTitle("問題")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct QuestionView_Previews: PreviewProvider {
    
    struct PreviewWrapper: View {
        @State var showingSheet = false
        var body: some View {
            QuestionView(questinos: [Question.mock()], showingSheet: $showingSheet)

        }
    }
    static var previews: some View {
        PreviewWrapper()
    }
}
