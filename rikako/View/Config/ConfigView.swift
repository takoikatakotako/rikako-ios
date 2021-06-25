import SwiftUI

struct ConfigView: View {
    @StateObject var viewModel = ConfigViewModel()
    var body: some View {
        NavigationView {
            List {
                Section(header: SectionHeader(text: "問題設定")) {
                    Button {
                        
                    } label: {
                        HStack {
                            Text("問題数")
                            Spacer()
                            Text("\(viewModel.questionNumber)")
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        Text("カテゴリ")
                    }
                }
                
                Section(header: SectionHeader(text: "チュートリアル")) {
                    Button {
                        
                    } label: {
                        Text("使い方")
                    }
                }
                
                Section(header: SectionHeader(text: "サウンド")) {
                    Button {
                        
                    } label: {
                        Text("効果音")
                    }
                    
                    Button {
                        
                    } label: {
                        Text("バイブ設定")
                    }
                }
                
                Section(header: SectionHeader(text: "その他")) {
                    
                    Button {
                        
                    } label: {
                        Text("レビューする")
                    }
                    
                    Button {
                        
                    } label: {
                        Text("理科子さんのTwitter")
                    }
                }
                
                Section(header: SectionHeader(text: "")) {
                    Button {
                        
                    } label: {
                        Text("リセット")
                    }
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
