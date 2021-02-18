import SwiftUI

struct QuestionView: View {
    var body: some View {
        VStack(spacing: 4) {
            Text("xxxx")
                .navigationBarTitle("XXXX")
                .navigationBarTitleDisplayMode(.inline)
            
            Spacer()
            
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
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
