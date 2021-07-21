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
                    Image(systemName: "photo")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.gray)
                        .padding(8)
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
                Image(systemName: "checkmark")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(R.color.main.name))
                    .frame(width: 18, height: 18)
                    .padding(.trailing, 8)
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
