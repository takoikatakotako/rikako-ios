import SwiftUI

struct QuestionView: View {
    @StateObject var viewModel: QuestionViewModel
    @Binding var showingSheet: HomeViewFullScreenCover?
    
    init(questinos: [Question], showingSheet: Binding<HomeViewFullScreenCover?>) {
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
                    
                    HStack {
                        ForEach(viewModel.question.images, id: \.self) { image in
                            Button {
                                viewModel.showingModal = true
                            } label: {
                                if let uiImage = viewModel.getUIImage(name: image) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 90)
                                } else {
                                    Image("tutorial-screen1")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 90)
                                }
                            }
                        }
                    }
                    
                    VStack {
                        Spacer()
                        HStack(spacing: 0) {
                            Spacer()

                            Button(action: {
                                viewModel.skip()
                            }, label: {
                                Text("スキップ")
                                    .frame(width: 98, height: 32)
                                    .foregroundColor(Color.white)
                                    .font(Font.system(size: 16).bold())
                                    .background(Color("incorrectBlue"))
                                    .cornerRadius(4)
                            })
                            .padding(.trailing, 8)
                            
                            Button(action: {
                                viewModel.showingModal = true
                            }, label: {
                                Text("答えを見る")
                                    .frame(width: 98, height: 32)
                                    .foregroundColor(Color.white)
                                    .font(Font.system(size: 16).bold())
                                    .background(Color("correctPink"))
                                    .cornerRadius(4)
                            })
                            .padding(.trailing, 8)
                            
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
            NavigationView {
                QuestionDetailView(question: viewModel.question)
            }
        }
        .alert(isPresented: $viewModel.showingAlert) {
            Alert(title: Text(""),
                  message: Text("問題の途中ですがホーム画面に戻りますか？"),
                  primaryButton: .cancel(Text("キャンセル")),
                  secondaryButton: .default(Text("はい"), action: {
                    showingSheet = nil
                  }))
        }
        .navigationBarTitle("問題")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: Button(action: {
            viewModel.showCloaseConfirmAlert()
        }, label: {
            Image(systemName: "house")
                .renderingMode(.template)
                .foregroundColor(.black)
        }))
    }
}

struct QuestionView_Previews: PreviewProvider {
    
    struct PreviewWrapper: View {
        @State var showingSheet: HomeViewFullScreenCover? = .study
        var body: some View {
            QuestionView(questinos: [Question.mock()], showingSheet: $showingSheet)
            
        }
    }
    static var previews: some View {
        NavigationView {
            PreviewWrapper()
        }
    }
}
