import SwiftUI

struct ImageViewer: View {
    let imageName: String
    var body: some View {
        if let uiImage = getUIImage() {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        } else {
            Image("tutorial-screen1")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
    }
    
    func getUIImage() -> UIImage? {
        guard let imageData = try? FileRepository().getImageFile(name: imageName) else {
            return nil
        }
        return UIImage(data: imageData)
    }
}

struct ImageViewer_Previews: PreviewProvider {
    static var previews: some View {
        ImageViewer(imageName: "imageName")
    }
}
