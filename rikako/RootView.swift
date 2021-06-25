import SwiftUI

struct RootView: View {
    let fileRepository = FileRepository()
    var body: some View {
        TopView()
            .onAppear {
                try! fileRepository.initialize()
            }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
