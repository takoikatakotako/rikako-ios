import SwiftUI
import GoogleMobileAds
import UIKit

final private class AdmobBannerViewController: UIViewControllerRepresentable  {
    let adUnitId: String
    
    init(adUnitID: String) {
        adUnitId = adUnitID
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let view = GADBannerView(adSize: kGADAdSizeBanner)

        let viewController = UIViewController()
        view.adUnitID = adUnitId
        view.rootViewController = viewController
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: kGADAdSizeBanner.size)
        view.load(GADRequest())
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct AdmobBannerView: View {
    let adUnitID: String
    var body: some View{
        HStack{
            Spacer()
            AdmobBannerViewController(adUnitID: adUnitID)
                .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height, alignment: .center)
            Spacer()
        }
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        // TestUnitId
        AdmobBannerView(adUnitID: ADMOB_UNIT_ID)
    }
}
