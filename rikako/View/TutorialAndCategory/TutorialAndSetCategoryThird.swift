import SwiftUI

struct TutorialAndSetCategoryThird: View {
    var body: some View {
        TutorialViewContent(imageName: R.image.tutorialScreen2.name) {
            TutorialAndSetCategoryFourth()
        }
    }
}

struct TutorialThirdView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategoryThird()
    }
}
