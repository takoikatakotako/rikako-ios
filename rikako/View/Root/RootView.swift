import SwiftUI

struct RootView: View {
    @EnvironmentObject var appEnviroment: RikakoAppEnvironment
    
    var body: some View {
        if appEnviroment.doneTutorial {
            TopView()
        } else {
            TutorialAndSetCategoryView()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
