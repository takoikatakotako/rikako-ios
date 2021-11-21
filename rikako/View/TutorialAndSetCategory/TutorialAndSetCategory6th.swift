import SwiftUI

struct TutorialAndSetCategory6th: View {
    var body: some View {
        TutorialViewContent(imageName: R.image.tutorialScreen5.name) {
            TutorialAndSetCategory7th()
        }
    }
}

struct TutorialAndSetCategory6th_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategory6th()
    }
}
