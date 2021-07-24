import SwiftUI

struct TutorialAndSetCategoryThird: View {
    var body: some View {
        VStack {
            Image(R.image.tutorialScreen2 .name)
            NavigationLink(
                destination: TutorialAndSetCategoryFourth(),
                label: {
                    Text("Next")
                })
        }
    }
}

struct TutorialThirdView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAndSetCategoryThird()
    }
}
