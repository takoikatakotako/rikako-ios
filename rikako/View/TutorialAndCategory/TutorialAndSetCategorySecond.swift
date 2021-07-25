import SwiftUI

struct TutorialAndSetCategorySecond: View {
    var body: some View {
        TutorialViewContent(imageName: R.image.tutorialScreen1.name) {
            TutorialAndSetCategoryThird()
        }
    }
}

struct TutorialSecondView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategorySecond()
    }
}
