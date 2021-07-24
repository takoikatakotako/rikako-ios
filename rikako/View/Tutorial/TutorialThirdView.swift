import SwiftUI

struct TutorialThirdView: View {
    var body: some View {
        VStack {
            Image(R.image.tutorialScreen2 .name)
            NavigationLink(
                destination: TutorialFourthView(),
                label: {
                    Text("Next")
                })
        }
    }
}

struct TutorialThirdView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialThirdView()
    }
}
