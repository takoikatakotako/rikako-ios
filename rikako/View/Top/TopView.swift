import SwiftUI

struct TopView: View {
    @StateObject var viewModel = TopViewModel()
    
    var body: some View {
        TabView {
            ZStack {
                Color("main")
                    .ignoresSafeArea(edges: .all)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color.red)
                
                VStack {
                    Spacer()
                    Image("top-app-logo")
                    Image("top-rikako-standing")
                    Spacer()
                    HStack {
                        Text("高校受験化学")
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 20).bold())
                        Spacer()
                        Text("達成率2.3%")
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 20).bold())
                    }
                    .padding(.horizontal, 8)
                    .padding(.bottom, 4)
                    
                    HStack(spacing: 12) {
                        Button(action: {
                            viewModel.studyButtonTapped()
                        }, label: {
                            Text("復習(23)")
                                .foregroundColor(Color.white)
                                .font(Font.system(size: 20).bold())
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 48)
                                .background(Color("incorrectBlue"))
                                .cornerRadius(8)
                        })
                        
                        Button(action: {
                            viewModel.studyButtonTapped()
                        }, label: {
                            Text("未学習(13)")
                                .foregroundColor(Color.white)
                                .font(Font.system(size: 20).bold())
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 48)
                                .background(Color("correctPink"))
                                .cornerRadius(8)
                        })
                    }
                    .padding(.horizontal, 8)
                    .padding(.bottom, 8)
                }
            }
            .tabItem {
                Image(systemName: "1.square.fill")
                    .renderingMode(.template)
                Text("First")
            }
            FirstCategoryView()
                .tabItem {
                    Image(systemName: "2.square.fill")
                        .renderingMode(.template)
                    Text("Second")
                }
            ConfigView()
                .tabItem {
                    Image(systemName: "3.square.fill")
                        .renderingMode(.template)
                    Text("Third")
                }
        }
        .accentColor(Color("main"))
        .background(Color.white)
        .fullScreenCover(item: $viewModel.sheet) { item in
            switch item {
            case .study:
                NavigationView {
                    QuestionView(questinos: viewModel.getStudyQuestions(), showingSheet: $viewModel.sheet)
                }
            case .review:
                NavigationView {
                    QuestionView(questinos: viewModel.getStudyQuestions(), showingSheet: $viewModel.sheet)
                }
            }
        }
        .alert(item: $viewModel.alert) {item in
            switch item {
            case let .message(_, message):
                return Alert(title: Text(message))
            }
        }
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
