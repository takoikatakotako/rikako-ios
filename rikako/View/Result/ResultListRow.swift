import SwiftUI

struct ResultListRow: View {
    let result: Bool
    let text: String
    var body: some View {
        HStack(spacing: 4) {
            if result {
                Image("result-correct")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .opacity(0.4)
            } else {
                Image("result-discorrect")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .opacity(0.4)
            }
            
            Text(text)
                .font(Font.system(size: 16))
                .foregroundColor(Color("textGray"))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

struct ResultViewRow_Previews: PreviewProvider {
    static var previews: some View {
        ResultListRow(result: true, text: "こちら問題文です。ここに問題文が入ります。")
            .previewLayout(.sizeThatFits)
    }
}
