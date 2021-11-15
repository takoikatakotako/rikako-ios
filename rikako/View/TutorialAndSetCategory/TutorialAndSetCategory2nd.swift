import SwiftUI

struct TutorialAndSetCategory2nd: View {
    var body: some View {
        TutorialViewContent(imageName: R.image.tutorialScreen1.name) {
            TutorialAndSetCategory3rd()
        }
    }
}

struct TutorialAndSetCategory2nd_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategory2nd()
    }
}
