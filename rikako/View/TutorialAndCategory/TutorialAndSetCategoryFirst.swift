import SwiftUI

struct TutorialAndSetCategoryFirst: View {
    var body: some View {
        TutorialViewContent(imageName: R.image.tutorialScreen0.name) {
            TutorialAndSetCategorySecond()
        }
    }
}

struct TutorialFirstView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategoryFirst()
    }
}
