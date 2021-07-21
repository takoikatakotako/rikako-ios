import SwiftUI

struct SectionHeader: View {
    let text: String
    var body: some View {
        Text(text)
            .padding()
            .frame(width: UIScreen.main.bounds.width, height: 28, alignment: .leading)
            .background(Color(R.color.viewBackground.name))
            .foregroundColor(Color.black)
    }
}

struct SectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeader(text: "xxxx")
    }
}
