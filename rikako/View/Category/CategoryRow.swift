import SwiftUI
import SDWebImageSwiftUI

struct CategoryRow: View {
    let imagePath: String
    let name: String
    let check: Bool
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
            
            if check {
                Text("✅")
                    .padding(.trailing, 16)
            }
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CategoryRow(imagePath: "https://rikako.jp/resource/images/7.png", name: "科学", check: true)
                .previewLayout(.sizeThatFits)
            
            CategoryRow(imagePath: "https://rikako.jp/resource/images/7.png", name: "科学", check: false)
                .previewLayout(.sizeThatFits)
        }
    }
}
