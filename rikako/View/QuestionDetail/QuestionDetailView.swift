import SwiftUI

struct QuestionDetailView: View {
    let text: String
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text(text)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .padding()
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                
                Image("tutorial-screen1")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color.black)
                
                Image("tutorial-screen1")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color.black)
            }
            .navigationBarTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct QuestionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionDetailView(text: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
    }
}
