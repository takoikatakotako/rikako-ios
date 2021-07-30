import SwiftUI

struct TutorialViewContent<Content: View>: View {
    let imageName: String
    let destination: Content
    
    init(imageName: String, @ViewBuilder destination: () -> Content) {
        self.imageName = imageName
        self.destination = destination()
    }
    
    var body: some View {
        ZStack {
            Color(R.color.main.name)
                .ignoresSafeArea(edges: .all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            VStack {
                Spacer()
                Image(imageName)
                Spacer()
                NavigationLink(
                    destination: destination,
                    label: {
                        TutorialNextButton()
                            .padding()
                    })
                    .padding(.bottom, 16)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct TutorialViewContent_Previews: PreviewProvider {
    static var previews: some View {
        TutorialViewContent(imageName: R.image.tutorialScreen2.name) {
            Text("Second")
        }
    }
}