import SwiftUI
import Firebase

@main
struct rikakoApp: App {
    let doneTutorial: Bool
    init() {
        let userDefaultsRepository = UserDefaultsRepository()
        try? userDefaultsRepository.initialize()
        try? FileRepository().initialize()
        doneTutorial = userDefaultsRepository.getDoneTutorial()
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(RikakoAppEnvironment(doneTutorial: doneTutorial))
        }
    }
}
