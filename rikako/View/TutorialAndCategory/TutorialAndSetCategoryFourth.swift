import SwiftUI

struct TutorialAndSetCategoryFourth: View {
    var body: some View {
        TutorialViewContent(imageName: R.image.tutorialScreen3.name) {
            TutorialAndSetCategoryFifth()
        }
    }
}

struct TutorialFourthView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategoryFourth()
    }
}
