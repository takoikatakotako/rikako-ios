import SwiftUI

struct TutorialFirstView: View {
    var body: some View {
        VStack {
            Image(R.image.tutorialScreen0.name)
            NavigationLink(
                destination: TutorialSecondView(),
                label: {
                    Text("Next")
                })
        }
    }
}

struct TutorialFirstView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialFirstView()
    }
}
