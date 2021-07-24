import SwiftUI

struct TutorialAndSetCategoryFifth: View {
    var body: some View {
        VStack {
            Image(R.image.tutorialScreen4 .name)
            NavigationLink(
                destination: TutorialAndSetCategorySixth(),
                label: {
                    Text("Next")
                })
        }
    }
}

struct TutorialFifthView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategoryFifth()
    }
}
