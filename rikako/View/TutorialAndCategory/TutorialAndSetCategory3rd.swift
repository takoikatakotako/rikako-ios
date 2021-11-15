import SwiftUI

struct TutorialAndSetCategory3rd: View {
    var body: some View {
        TutorialViewContent(imageName: R.image.tutorialScreen2.name) {
            TutorialAndSetCategoryFourth()
        }
    }
}

struct TutorialAndSetCategory3rd_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategory3rd()
    }
}
