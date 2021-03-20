import SwiftUI

struct QuestionView: View {
    @StateObject var viewModel: QuestionViewModel
    
    init(questinos: [Question]) {
        _viewModel = StateObject(wrappedValue: QuestionViewModel(questions: questinos))
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
                destination: ResultView(results: $viewModel.results),
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
    static var previews: some View {
        QuestionView(questinos: [Question.mock()])
    }
}
