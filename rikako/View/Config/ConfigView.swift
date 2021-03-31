import SwiftUI

struct ConfigView: View {
    var body: some View {
        NavigationView {
            Text("Hello, World!")
                .navigationTitle("設定")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
