import SwiftUI

struct TutorialSeventhView: View {
    @EnvironmentObject var appEnviroment: RikakoAppEnvironment
    var body: some View {
        VStack {
            Image(R.image.tutorialScreen6.name)
            if true {
                Button(action: {
                    appEnviroment.doneTutorial = true
                }, label: {
                    Text("Clouse")
                })
            } else {
                NavigationLink(
                    destination: Text("Done"),
                    label: {
                        Text("Next")
                    })
            }
        }
    }
}

struct TutorialSeventhView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialSeventhView()
    }
}
