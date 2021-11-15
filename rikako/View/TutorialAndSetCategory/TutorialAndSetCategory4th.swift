import SwiftUI

struct TutorialAndSetCategory4th: View {
    var body: some View {
        TutorialViewContent(imageName: R.image.tutorialScreen3.name) {
            TutorialAndSetCategory5th()
        }
    }
}

struct TutorialAndSetCategory4th_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategory4th()
    }
}
