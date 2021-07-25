import SwiftUI

struct TutorialNextButton: View {
    var body: some View {
        Text("つぎへ")
            .foregroundColor(Color(R.color.textBrown.name))
            .font(Font.system(size: 20).bold())
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 60)
            .background(Color(R.color.selectButton.name))
            .cornerRadius(8)
    }
}

struct TutorialNextButton_Previews: PreviewProvider {
    static var previews: some View {
        TutorialNextButton()
            .previewLayout(.sizeThatFits)
    }
}
