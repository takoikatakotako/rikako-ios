import SwiftUI

struct QuestionDetailView: View {
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
                
                ForEach(question.answers, id: \.self) { answer in
                    Text(answer)
                        .lineLimit(2)
                        .foregroundColor(Color(R.color.textBrown.name))
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Color(R.color.selectButton.name))
                        .cornerRadius(8)
                        .padding(.horizontal, 8)
                        .padding(.bottom, 2)
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

struct QuestionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            QuestionDetailView(question: Question.mock())
        }
    }
}
