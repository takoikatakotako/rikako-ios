import SwiftUI
import SDWebImageSwiftUI

struct CategoryRow: View {
    let imagePath: String
    let name: String
    var body: some View {
        HStack {
            WebImage(url: URL(string: imagePath))
                .resizable()
                .placeholder {
                    Image("question-correct")
                        .resizable()
                }
                .animation(.easeInOut(duration: 0.5))
                .transition(.fade)
                .frame(width: 60, height: 60)
                .scaledToFill()
            VStack {
                Text(name)
            }
            Spacer()
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(imagePath: "https://rikako.jp/resource/images/7.png", name: "科学")
    }
}
