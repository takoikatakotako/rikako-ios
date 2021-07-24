import SwiftUI

struct TutorialSixthView: View {
    var body: some View {
        VStack {
            Image(R.image.tutorialScreen5.name)
            NavigationLink(
                destination: TutorialSeventhView(),
                label: {
                    Text("Next")
                })
        }
    }
}

struct TutorialSixthView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialSixthView()
    }
}
