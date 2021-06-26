import SwiftUI

struct QuestionNumberSelecter: View {
    @Binding var questionNumber: Int
    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: $questionNumber, label: Text("")) {
                    ForEach((1...20), id: \.self) {
                        Text("\($0)")
                    }
                }
                .labelsHidden()
            }
            .navigationTitle("問題数を設定")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//struct QuestionNumberSelecter_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionNumberSelecter()
//    }
//}
