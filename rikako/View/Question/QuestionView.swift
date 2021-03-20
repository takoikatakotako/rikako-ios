import SwiftUI

struct QuestionView: View {
    @StateObject var viewModel = QuestionViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 8) {
                ZStack {
                    Button(action: {
                        viewModel.showingModal = true
                    }) {
                        VStack {
                            Text(viewModel.question.text)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                                .padding()
                            Spacer()
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    
                    VStack {
                        Spacer()
                        HStack {
                            ForEach(viewModel.question.images, id: \.self) { image in
                                Image("tutorial-screen1")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 90, height: 90)
                                    .background(Color.black)
                            }
                        }
                    }
                }
                .background(Color.orange)
                
                ForEach(viewModel.question.answers, id: \.self) { answer in
                    QuestionButton(text: answer) {
                        print(answer)
                    }
                }

                
                Text("Admob")
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color.gray)
            }
            
        }
        .sheet(isPresented: $viewModel.showingModal) {
            QuestionDetailView(text: "ssssssssss")
        }
        .navigationBarTitle("XXXX")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
