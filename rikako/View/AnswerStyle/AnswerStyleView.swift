import SwiftUI

struct AnswerStyleView: View {
    var body: some View {
        NavigationView {
            VStack {
                Button {
                    
                } label: {
                    Text("毎回解答を表示する")
                }

                Button {
                    
                } label: {
                    Text("間違えた問題のみ解答を表示する")
                }
                
                Button {
                    
                } label: {
                    Text("間違えても解答を表示しない")
                }
            }
            .navigationTitle("解答形式")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AnswerStyleView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerStyleView()
    }
}
