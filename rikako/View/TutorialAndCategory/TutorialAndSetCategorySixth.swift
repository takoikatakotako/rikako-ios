import SwiftUI

struct TutorialAndSetCategorySixth: View {
    var body: some View {
        VStack {
            Image(R.image.tutorialScreen5.name)
            NavigationLink(
                destination: TutorialAndSetCategorySeventh(),
                label: {
                    Text("Next")
                })
        }
    }
}

struct TutorialSixthView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategorySixth()
    }
}
