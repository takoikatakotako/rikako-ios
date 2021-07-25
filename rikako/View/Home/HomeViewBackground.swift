import SwiftUI

struct HomeViewBackground: View {
    let imageName: String
    private let imageHeight: CGFloat = 100
    @State var firstLine0x: CGFloat
    @State var firstLine0y: CGFloat
    @State var firstLine1x: CGFloat
    @State var firstLine1y: CGFloat
    @State var firstLine2x: CGFloat
    @State var firstLine2y: CGFloat
    @State var secondLine0x: CGFloat
    @State var secondLine0y: CGFloat
    @State var secondLine1x: CGFloat
    @State var secondLine1y: CGFloat
    @State var secondLine2x: CGFloat
    @State var secondLine2y: CGFloat
    @State var secondLine3x: CGFloat
    @State var secondLine3y: CGFloat
    @State var thirdLine0x: CGFloat
    @State var thirdLine0y: CGFloat
    @State var thirdLine1x: CGFloat
    @State var thirdLine1y: CGFloat
    @State var thirdLine2x: CGFloat
    @State var thirdLine2y: CGFloat
    
    init(imageName: String) {
        self.imageName = imageName
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        firstLine0x = width
        firstLine0y = -height * 0.25
        firstLine1x = width * 0.5
        firstLine1y = 0
        firstLine2x = 0
        firstLine2y = height * 0.25
        
        secondLine0x = width * 1.5
        secondLine0y = 0
        secondLine1x = width
        secondLine1y = height * 0.25
        secondLine2x = width * 0.5
        secondLine2y = height * 0.5
        secondLine3x = 0
        secondLine3y = height * 0.75
        
        thirdLine0x = width * 1.5
        thirdLine0y = height * 0.5
        thirdLine1x = width
        thirdLine1y = height * 0.75
        thirdLine2x = width * 0.5
        thirdLine2y = height
    }
    
    var body: some View {
        ZStack {
            Image(R.image.topChemiFormula.name)
                .resizable()
                .frame(height: imageHeight)
                .scaledToFit()
                .position(x: firstLine0x, y: firstLine0y)
            Image(R.image.topChemiFormula.name)
                .resizable()
                .frame(height: imageHeight)
                .scaledToFit()
                .position(x: firstLine1x, y: firstLine1y)
            Image(R.image.topChemiFormula.name)
                .resizable()
                .frame(height: imageHeight)
                .scaledToFit()
                .position(x: firstLine2x, y: firstLine2y)
            
            Image(R.image.topChemiFormula.name)
                .resizable()
                .frame(height: imageHeight)
                .scaledToFit()
                .position(x: secondLine0x, y: secondLine0y)
            Image(R.image.topChemiFormula.name)
                .resizable()
                .frame(height: imageHeight)
                .scaledToFit()
                .position(x: secondLine1x, y: secondLine1y)
            Image(R.image.topChemiFormula.name)
                .resizable()
                .frame(height: imageHeight)
                .scaledToFit()
                .position(x: secondLine2x, y: secondLine2y)
            Image(R.image.topChemiFormula.name)
                .resizable()
                .frame(height: imageHeight)
                .scaledToFit()
                .position(x: secondLine3x, y: secondLine3y)
            
            Image(R.image.topChemiFormula.name)
                .resizable()
                .frame(height: imageHeight)
                .scaledToFit()
                .position(x: thirdLine0x, y: thirdLine0y)
            Image(R.image.topChemiFormula.name)
                .resizable()
                .scaledToFit()
                .frame(height: imageHeight)
                .position(x: thirdLine1x, y: thirdLine1y)
            Image(R.image.topChemiFormula.name)
                .resizable()
                .scaledToFit()
                .frame(height: imageHeight)
                .position(x: thirdLine1x, y: thirdLine1y)
        }
        .onAppear {
            withAnimation(
                Animation
                    .linear(duration: 4)
                    .repeatForever(autoreverses: false)) {
                let width = UIScreen.main.bounds.width
                let height = UIScreen.main.bounds.height
                firstLine0x = width * 0.5
                firstLine0y = 0
                firstLine1x = 0
                firstLine1y = height * 0.25
                firstLine2x = -width * 0.5
                firstLine2y = height * 0.5
                
                secondLine0x = width
                secondLine0y = height * 0.25
                secondLine1x = width * 0.5
                secondLine1y = height * 0.5
                secondLine2x = 0
                secondLine2y = height * 0.75
                secondLine3x = -width * 0.5
                secondLine3y = height
                
                thirdLine0x = width
                thirdLine0y = height * 0.75
                thirdLine1x = width * 0.5
                thirdLine1y = height
                thirdLine2x = width
                thirdLine2y = height * 1.25
            }
        }
    }
}

struct HomeViewBackground_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewBackground(imageName: R.image.topChemiFormula.name)
    }
}
