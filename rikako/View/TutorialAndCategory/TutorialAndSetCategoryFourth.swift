import SwiftUI

struct TutorialAndSetCategoryFourth: View {
    var body: some View {
        VStack {
            Image(R.image.tutorialScreen3 .name)
            NavigationLink(
                destination: TutorialAndSetCategoryFifth(),
                label: {
                    Text("Next")
                })
        }
    }
}

struct TutorialFourthView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategoryFourth()
    }
}
