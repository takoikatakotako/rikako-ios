import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            Color(R.color.main.name)
                .ignoresSafeArea(edges: .all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(Color.red)
            
            VStack {
                Spacer()
                Image(R.image.topAppLogo.name)
                    .padding(.bottom, 36)
                Image(R.image.topRikakoStanding.name)
                Spacer()
                HStack {
                    Text(viewModel.categoryName)
                        .foregroundColor(Color.white)
                        .font(Font.system(size: 20).bold())
                    Spacer()
                    Text(viewModel.progressText)
                        .foregroundColor(Color.white)
                        .font(Font.system(size: 20).bold())
                }
                .padding(.horizontal, 8)
                .padding(.bottom, 4)
                
                HStack(spacing: 12) {
                    Button(action: {
                        viewModel.reviewButtonTapped()
                    }, label: {
                        Text(viewModel.reviewText)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 20).bold())
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 48)
                            .background(Color(R.color.incorrectBlue.name))
                            .cornerRadius(8)
                    })
                    
                    Button(action: {
                        viewModel.studyButtonTapped()
                    }, label: {
                        Text(viewModel.studyText)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 20).bold())
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 48)
                            .background(Color(R.color.correctPink.name))
                            .cornerRadius(8)
                    })
                }
                .padding(.horizontal, 8)
                .padding(.bottom, 8)
            }
        }
        .onAppear {
            viewModel.setCategoryInfo()
        }
        .fullScreenCover(item: $viewModel.sheet, onDismiss: {
            viewModel.setCategoryInfo()
        }, content: { item in
            switch item {
            case let .study(_, questions):
                NavigationView {
                    QuestionView(questionType: .study, questinos: questions, showingSheet: $viewModel.sheet)
                }
            case let .review(_, questions):
                NavigationView {
                    QuestionView(questionType: .review, questinos: questions, showingSheet: $viewModel.sheet)
                }
            }
        })
        
        .alert(item: $viewModel.alert) {item in
            switch item {
            case .questionEmpty(_):
                return Alert(
                    title: Text("問題がありません"),
                    message: Text("解ける問題がありません。既に解いている問題をもう一度解きますか？"),
                    primaryButton: .default(Text("はい"), action: {
                        viewModel.solvedToUnsolved()
                    }),
                    secondaryButton: .cancel(Text("閉じる")))
            case let .message(_, message):
                return Alert(title: Text(""), message: Text(message))
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
