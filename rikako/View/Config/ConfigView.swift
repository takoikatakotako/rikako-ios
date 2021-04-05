import SwiftUI

struct ConfigView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: SectionHeader(text: "問題設定")) {
                    Text("問題数")
                    Text("カテゴリ")
                }
                
                Section(header: SectionHeader(text: "チュートリアル")) {
                    Text("使い方")
                }
                
                Section(header: SectionHeader(text: "サウンド")) {
                    Text("効果音")
                    Text("バイブ設定")
                }
                
                Section(header: SectionHeader(text: "その他")) {
                    Text("レビューする")
                    Text("理科子さんのTwitter")
                }
                
                Section(header: SectionHeader(text: "")) {
                    Text("リセット")
                }
            }
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
