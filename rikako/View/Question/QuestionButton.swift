import SwiftUI

struct QuestionButton: View {
    let text: String
    let action: () -> Void
    
    init(text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(text)
                .lineLimit(2)
                .foregroundColor(Color(R.color.textBrown.name))
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 60)
        })
        .background(Color(R.color.selectButton.name))
        .cornerRadius(8)
        .padding(.horizontal, 8)
    }
}

struct QuestionButton_Previews: PreviewProvider {
    struct PreviewWarpper: View {
        var body: some View {
            QuestionButton(text: "Tap me!!") {
                print("Hello")
            }
        }
    }
    
    static var previews: some View {
        PreviewWarpper()
            .previewLayout(.sizeThatFits)
    }
}
