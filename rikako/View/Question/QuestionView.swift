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
                            Text("xxxxxxxxx")
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
                            Image("tutorial-screen1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90, height: 90)
                                .background(Color.black)
                            
                            Image("tutorial-screen1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90, height: 90)
                                .background(Color.black)
                            
                            Image("tutorial-screen1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90, height: 90)
                                .background(Color.black)
                        }
                    }
                }
                .background(Color.orange)
                
                QuestionButton(text: "選択１") {
                    
                }
                
                QuestionButton(text: "選択２") {
                    
                }
                
                QuestionButton(text: "選択３") {
                    
                }
                
                QuestionButton(text: "選択４") {
                    
                }
                
                Text("Admob")
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color.gray)
            }
            
        }
        .sheet(isPresented: $viewModel.showingModal) {
            Text("xxxxxxx")
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
