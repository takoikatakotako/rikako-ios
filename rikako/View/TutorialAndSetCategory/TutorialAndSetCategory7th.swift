import SwiftUI

struct TutorialAndSetCategory7th: View {
    @EnvironmentObject var appEnviroment: RikakoAppEnvironment
    var body: some View {
        TutorialViewContent(imageName: R.image.tutorialScreen6.name) {
            TutorialAndSetCategory8th()
        }
    }
}

struct TutorialAndSetCategory7th_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategory7th()
    }
}
