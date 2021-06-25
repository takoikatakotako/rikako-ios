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
            .onAppear {
                viewModel.setCategoryInfo()
            }
            .tabItem {
                Image(systemName: "house")
                    .renderingMode(.template)
                Text("ホーム")
            }
            FirstCategoryView()
                .tabItem {
                    Image(systemName: "books.vertical")
                        .renderingMode(.template)
                    Text("カテゴリ")
                }
            ConfigView()
                .tabItem {
                    Image(systemName: "gearshape")
                        .renderingMode(.template)
                    Text("設定")
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
