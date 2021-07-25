import SwiftUI

struct TutorialAndSetCategorySeventh: View {
    @EnvironmentObject var appEnviroment: RikakoAppEnvironment
    var body: some View {
        TutorialViewContent(imageName: R.image.tutorialScreen6.name) {
            TutorialAndSetCategoryEighth()
        }
    }
}

struct TutorialSeventhView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategorySeventh()
    }
}
