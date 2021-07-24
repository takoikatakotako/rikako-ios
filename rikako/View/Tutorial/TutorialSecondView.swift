import SwiftUI

struct TutorialSecondView: View {
    var body: some View {
        VStack {
            Image(R.image.tutorialScreen1.name)
            NavigationLink(
                destination: TutorialThirdView(),
                label: {
                    Text("Next")
                })
        }
    }
}

struct TutorialSecondView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialSecondView()
    }
}
