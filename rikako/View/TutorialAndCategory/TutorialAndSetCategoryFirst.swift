import SwiftUI

struct TutorialAndSetCategoryFirst: View {
    var body: some View {
        VStack {
            Image(R.image.tutorialScreen0.name)
            NavigationLink(
                destination: TutorialAndSetCategorySecond(),
                label: {
                    Text("Next")
                })
        }
    }
}

struct TutorialFirstView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategorySecond()
    }
}
