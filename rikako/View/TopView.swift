import SwiftUI

struct TopView: View {
    var body: some View {
        NavigationView {
            
            QuestionView()
            
//            NavigationLink(
//                destination: QuestionView(),
//                label: {
//                    /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/
//                })
        }
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
