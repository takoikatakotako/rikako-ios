import SwiftUI

struct TutorialFourthView: View {
    var body: some View {
        VStack {
            Image(R.image.tutorialScreen3 .name)
            NavigationLink(
                destination: TutorialFifthView(),
                label: {
                    Text("Next")
                })
        }
    }
}

struct TutorialFourthView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialFourthView()
    }
}
