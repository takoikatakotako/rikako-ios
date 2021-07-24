import SwiftUI

class RikakoAppEnvironment: ObservableObject {
    @Published var doneTutorial: Bool
    
    init(doneTutorial: Bool) {
        self.doneTutorial = doneTutorial
    }
}

