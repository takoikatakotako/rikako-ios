import SwiftUI

struct ResultView: View {
    @Binding var results: [Bool]
    @Binding var showingSheet: Bool

    var body: some View {
        VStack {
            Text("結果")
            Text("\(results.filter{$0}.count) / \(results.count)")
            
            Button("xxx") {
                showingSheet = false
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

//struct ResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultView(results: <#[Bool]#>)
//    }
//}
