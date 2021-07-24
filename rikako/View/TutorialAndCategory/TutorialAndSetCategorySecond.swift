import SwiftUI

struct TutorialAndSetCategorySecond: View {
    var body: some View {
        VStack {
            Image(R.image.tutorialScreen1.name)
            NavigationLink(
                destination: TutorialAndSetCategoryThird(),
                label: {
                    Text("Next")
                })
        }
    }
}

struct TutorialSecondView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategorySecond()
    }
}
