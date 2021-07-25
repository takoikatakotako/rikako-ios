import SwiftUI

struct TutorialAndSetCategoryFifth: View {
    var body: some View {
        TutorialViewContent(imageName: R.image.tutorialScreen4.name) {
            TutorialAndSetCategorySixth()
        }
    }
}

struct TutorialFifthView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategoryFifth()
    }
}
