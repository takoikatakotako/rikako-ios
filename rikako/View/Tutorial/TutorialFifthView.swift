import SwiftUI

struct TutorialFifthView: View {
    var body: some View {
        VStack {
            Image(R.image.tutorialScreen4 .name)
            NavigationLink(
                destination: TutorialSixthView(),
                label: {
                    Text("Next")
                })
        }
    }
}

struct TutorialFifthView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialFifthView()
    }
}
