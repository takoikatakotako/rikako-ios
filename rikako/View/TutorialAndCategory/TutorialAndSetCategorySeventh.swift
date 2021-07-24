import SwiftUI

struct TutorialAndSetCategorySeventh: View {
    @EnvironmentObject var appEnviroment: RikakoAppEnvironment
    var body: some View {
        VStack {
            Image(R.image.tutorialScreen6.name)
            NavigationLink(
                destination: TutorialAndSetCategoryEighth(),
                label: {
                    Text("Next")
                })
        }
    }
}

struct TutorialSeventhView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategorySeventh()
    }
}
