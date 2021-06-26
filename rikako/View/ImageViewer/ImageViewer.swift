import SwiftUI

struct ImageViewer: View {
    let imageName: String
    var body: some View {
        Text("ImageViewer")
    }
}

struct ImageViewer_Previews: PreviewProvider {
    static var previews: some View {
        ImageViewer(imageName: "imageName")
    }
}
