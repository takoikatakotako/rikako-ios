import SwiftUI

struct QuestionAnswer: View {
    let question: Question
    var body: some View {
        ScrollView {
            LazyVStack {
                Text(question.text)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding()
                
                ForEach(question.images, id: \.self) { image in
                    if let uiImage = getUIImage(name: image) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 0, maxWidth: .infinity)
                    } else {
                        Image("tutorial-screen1")
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                }
                
                Text(question.answers[question.answer])
                    .lineLimit(2)
                    .foregroundColor(Color(R.color.textBrown.name))
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color(R.color.selectButton.name))
                    .cornerRadius(8)
                    .padding(.horizontal, 8)
                    .padding(.bottom, 2)
                
                Text(question.comment)
                
                ForEach(question.commentImages, id: \.self) { image in
                    if let uiImage = getUIImage(name: image) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 0, maxWidth: .infinity)
                    } else {
                        Image("tutorial-screen1")
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    func getUIImage(name: String) -> UIImage? {
        guard let imageData = try? FileRepository().getImageFile(name: name) else {
            return nil
        }
        return UIImage(data: imageData)
    }
}

struct QuestionAnswer_Previews: PreviewProvider {
    static var previews: some View {
        QuestionAnswer(question: Question.mock())
    }
}
