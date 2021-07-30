import SwiftUI
import Firebase
import GoogleMobileAds

var ADMOB_UNIT_ID: String!

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
        guard let admobUnitId = Bundle.main.infoDictionary?["ADMOB_UNIT_ID"] as? String else {
            fatalError("AdmobのUnitIdが見つかりません")
        }
        print(admobUnitId)
        
        ADMOB_UNIT_ID = "ca-app-pub-3940256099942544/2934735716"
    }
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(RikakoAppEnvironment(doneTutorial: doneTutorial))
        }
    }
}
