import SwiftUI

struct TutorialAndSetCategoryView: View {
    var body: some View {
        NavigationView {
            TutorialAndSetCategoryFirst()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

//struct TutorialView_Previews: PreviewProvider {
//    static var previews: some View {
//        TutorialHolderView(xxxx: )
//    }
//}
