import SwiftUI

struct DownloadView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewModel: DownloadViewModel
    
    init(categoryId: Int) {
        _viewModel = StateObject(wrappedValue: DownloadViewModel(categoryId: categoryId))
    }
    
    var body: some View {
        VStack {
            Text(viewModel.message)
            
            if viewModel.doneDownload {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("閉じる")
                        .foregroundColor(Color.black)
                        .padding(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .padding(.top, 16)
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .onAppear {
            viewModel.download()
        }
    }
}

struct Download_Previews: PreviewProvider {
    static var previews: some View {
        DownloadView(categoryId: 3)
    }
}
