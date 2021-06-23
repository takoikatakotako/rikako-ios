import SwiftUI

struct DownloadView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let categoryId: Int
    @StateObject var viewModel = DownloadViewModel()
    
    var body: some View {
        VStack {
            Text("ダウンロード中")
            
            Button {
                print("xxxx")
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("閉じる")
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.gray.edgesIgnoringSafeArea(.all))
        .onAppear {
            viewModel.download(categoryId: categoryId)
        }
        .alert(isPresented: $viewModel.showingAlert) {
            Alert(title: Text("タイトル"))
        }
    }
}

struct Download_Previews: PreviewProvider {
    static var previews: some View {
        DownloadView(categoryId: 3)
    }
}
