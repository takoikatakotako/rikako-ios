import SwiftUI

struct QuestionView: View {
    let questionType: QuestionType
    @StateObject var viewModel: QuestionViewModel
    @Binding var fullScreen: HomeViewFullScreenCover?
    
    init(questionType: QuestionType, questinos: [Question], showingSheet: Binding<HomeViewFullScreenCover?>) {
        self.questionType = questionType
        _viewModel = StateObject(wrappedValue: QuestionViewModel(questions: questinos))
        self._fullScreen = showingSheet
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 8) {
                ZStack {
                    Button(action: {
                        viewModel.showQuestionSheet()
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
                    .disabled(viewModel.buttonDisabled)
                    
                    HStack {
                        ForEach(viewModel.question.images, id: \.self) { image in
                            Button {
                                viewModel.showImageViewerSheet(image: image)
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
                            .disabled(viewModel.buttonDisabled)
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
                            .disabled(viewModel.buttonDisabled)
                            .padding(.trailing, 8)
                            
                            Button(action: {
                                viewModel.showAnserSheet()
                            }, label: {
                                Text("答えを見る")
                                    .frame(width: 98, height: 32)
                                    .foregroundColor(Color.white)
                                    .font(Font.system(size: 16).bold())
                                    .background(Color("correctPink"))
                                    .cornerRadius(4)
                            })
                            .disabled(viewModel.buttonDisabled)
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
                .padding(.bottom, 8)
                
                
                AdmobBannerView(adUnitID: ADMOB_UNIT_ID)
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
                destination: ResultView(questionType: questionType, questions: viewModel.questions, results: viewModel.results, showingSheet: $fullScreen),
                isActive: $viewModel.goReultView,
                label: {
                    EmptyView()
                })
        }
        .sheet(item: $viewModel.sheet) { item in
            switch item {
            case let .question(_, question):
                NavigationView {
                    QuestionDetailView(question: question)
                }
            case let .image(_, image):
                NavigationView {
                    ImageViewer(imageName: image)
                }
            case let .answer(_, question):
                NavigationView {
                    QuestionAnswer(question: question)
                }
            }
        }
        .alert(isPresented: $viewModel.showingAlert) {
            Alert(title: Text(""),
                  message: Text("問題の途中ですがホーム画面に戻りますか？"),
                  primaryButton: .cancel(Text("キャンセル")),
                  secondaryButton: .default(Text("はい"), action: {
                    fullScreen = nil
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
        .accentColor(Color(R.color.main.name))
    }
}

struct QuestionView_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State var showingSheet: HomeViewFullScreenCover? = nil
        var body: some View {
            QuestionView(questionType: .study, questinos: [Question.mock()], showingSheet: $showingSheet)
            
        }
    }
    static var previews: some View {
        NavigationView {
            PreviewWrapper()
        }
    }
}
