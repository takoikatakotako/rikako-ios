import SwiftUI

class TutorialAndSetCategoryTenthViewModel: ObservableObject {
    @Published var doneDownload = false
    @Published var showingErrorAlert = false
    private let categoryId: Int
    private let downloadUseCase = DownloadUseCase()
    private let categoryUseCase = CategoryUseCase()
    
    init(categoryId: Int) {
        self.categoryId = categoryId
    }
    
    func download() {
        downloadUseCase.download(categoryId: categoryId) { [weak self] result in
            switch result {
            case .success(_):
                self?.doneDownload = true
            case .failure(_):
                print("ダウンロードに失敗しました。")
                self?.doneDownload = false
            }
        }
    }
    
    func close() {
        do {
            try categoryUseCase.selectCategory(categoryId: categoryId)
        } catch {
            // TODO: エラーハンドリング
            print("XXXXX")
            return
        }
        UserDefaultsRepository().setDoneTutorial(doneTutorial: true)
    }
}

struct TutorialAndSetCategoryTenth: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var appEnviroment: RikakoAppEnvironment
    @StateObject var viewModel: TutorialAndSetCategoryTenthViewModel
    
    init(categoryId: Int) {
        _viewModel = StateObject(wrappedValue: TutorialAndSetCategoryTenthViewModel(categoryId: categoryId))
    }
    
    var body: some View {
        VStack {
            if viewModel.doneDownload {
                Text("ダウンロード完了です")
                Button {
                    viewModel.close()
                    withAnimation() {
                        appEnviroment.doneTutorial = true
                    }
                } label: {
                    Text("閉じる")
                }

            } else {
                Text("ダウンロード中です。")
            }
        }
        .onAppear {
            viewModel.download()
        }
        .alert(isPresented: $viewModel.showingErrorAlert) {
            Alert(title: Text("エラー"), message: Text("問題のダウンロードに失敗しました。ネットワークの接続を確認して再度ダウンロードを実行してください。"), primaryButton: .default(Text("ダウンロード"), action: {
                viewModel.download()
            }), secondaryButton: .cancel(Text("キャンセル"), action: {
                presentationMode.wrappedValue.dismiss()
            }))
        }
        .navigationBarHidden(true)
    }
}

struct TutorialAndSetCategoryTenth_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategoryTenth(categoryId: 3)
    }
}
