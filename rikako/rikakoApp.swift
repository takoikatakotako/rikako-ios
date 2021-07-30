import SwiftUI
import Firebase
import GoogleMobileAds

@main
struct rikakoApp: App {
    let doneTutorial: Bool
    init() {
        let userDefaultsRepository = UserDefaultsRepository()
        try? userDefaultsRepository.initialize()
        try? FileRepository().initialize()
        doneTutorial = userDefaultsRepository.getDoneTutorial()
        FirebaseApp.configure()
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(RikakoAppEnvironment(doneTutorial: doneTutorial))
        }
    }
}
