import SwiftUI

struct ConfigView: View {
    @StateObject var viewModel = ConfigViewModel()
    @Binding var tabSelection: Int
    var body: some View {
        NavigationView {
            List {
                Section(header: SectionHeader(text: "問題設定")) {
                    Button {
                        viewModel.questionNumberTapped()
                    } label: {
                        HStack {
                            Text("問題数")
                            Spacer()
                            Text("\(viewModel.questionNumber)")
                        }
                    }
                    
                    Button {
                        // カテゴリに移動する
                        tabSelection = 1
                    } label: {
                        HStack {
                            Text("カテゴリ")
                            Spacer()
                            Text("\(viewModel.categoryName)")
                        }
                    }
                }
                
                Section(header: SectionHeader(text: "チュートリアル")) {
                    Button {
                        
                    } label: {
                        Text("使い方")
                    }
                }
                
                Section(header: SectionHeader(text: "サウンド")) {
                    Toggle(isOn: $viewModel.soundOn) {
                        Text("効果音")
                    }
                    
                    Toggle(isOn: $viewModel.vibOn) {
                        Text("バイブ設定")
                    }
                }
                
                Section(header: SectionHeader(text: "その他")) {
                    Button {
                        viewModel.reviewButtonTapped()
                    } label: {
                        Text("レビューする")
                    }
                    
                    Button {
                        viewModel.twitterButtonTapped()
                    } label: {
                        Text("理科子さんのTwitter")
                    }
                }
                
                Section(header: SectionHeader(text: "リセット")) {
                    Button {
                        viewModel.resetButtonTapped()
                    } label: {
                        Text("リセット")
                    }
                }
            }
            .navigationTitle("設定")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear{
            viewModel.updateConfigs()
        }
        .alert(item: $viewModel.alert) {item in
            switch item {
            case .reset:
                return Alert(
                    title: Text("リセット"),
                    message: Text("データをリセットしてもよろしいですか？"),
                    primaryButton: .default(Text("リセット"), action: {
                        viewModel.reset()
                    }),
                    secondaryButton: .cancel(Text("キャンセル")))
            }
        }
        .sheet(item: $viewModel.sheet) {
            viewModel.setConfigs()
        } content: { item in
            switch item {
            case .questionNumber:
                QuestionNumberSelecter(questionNumber: $viewModel.questionNumber)
            }
        }
    }
}

struct ConfigView_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State var tabSelection: Int = 0
        var body: some View {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                            .renderingMode(.template)
                        Text("ホーム")
                    }
                    .tag(0)
                FirstCategoryView()
                    .tabItem {
                        Image(systemName: "books.vertical")
                            .renderingMode(.template)
                        Text("カテゴリ")
                    }
                    .tag(1)
                ConfigView(tabSelection: $tabSelection)
                    .tabItem {
                        Image(systemName: "gearshape")
                            .renderingMode(.template)
                        Text("設定")
                    }
                    .tag(2)
            }
        }
    }
    
    static var previews: some View {
        PreviewWrapper()
    }
}
