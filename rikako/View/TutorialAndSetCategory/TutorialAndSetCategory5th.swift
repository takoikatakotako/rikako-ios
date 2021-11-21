import SwiftUI

struct TutorialAndSetCategory5th: View {
    var body: some View {
        TutorialViewContent(imageName: R.image.tutorialScreen4.name) {
            TutorialAndSetCategory6th()
        }
    }
}

struct TutorialAndSetCategory5th_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategory5th()
    }
}
