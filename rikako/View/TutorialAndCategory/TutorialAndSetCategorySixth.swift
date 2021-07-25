import SwiftUI

struct TutorialAndSetCategorySixth: View {
    var body: some View {
        TutorialViewContent(imageName: R.image.tutorialScreen5.name) {
            TutorialAndSetCategorySeventh()
        }
    }
}

struct TutorialSixthView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategorySixth()
    }
}
