import SwiftUI

struct ResultListHeader: View {
    let results: [Bool]
    
    var resultImageName: String {
        if correctRate == 100 {
            return "result-100per"
        } else if correctRate >= 80 {
            return "result-80per"
        } else if correctRate >= 60 {
            return "result-60per"
        } else if correctRate >= 40 {
            return "result-40per"
        } else {
            return "result-20per"
        }
    }
    
    var correctRate: Double {
        return Double(results.filter{$0}.count) / Double(results.count) * 100
    }
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            HStack {
                Image(resultImageName)
                Spacer()
            }
            VStack(alignment: .trailing) {
                HStack(alignment: .bottom, spacing: 2) {
                    Text("正解率")
                        .font(Font.system(size: 18).bold())
                        .foregroundColor(Color("reaultColor-60per"))
                    
                    Text(String(format: "%.1f", correctRate))
                        .font(Font.system(size: 36).bold())
                        .foregroundColor(Color("reaultColor-60per"))
                    
                    Text("%")
                        .font(Font.system(size: 18).bold())
                        .foregroundColor(Color("reaultColor-60per"))
                }
                Text("\(results.filter{$0}.count)問/\(results.count)問")
                    .font(Font.system(size: 18))
                    .foregroundColor(Color("textGray"))
            }
        }
        .padding(8)
    }
}

struct ResultListHeader_Previews: PreviewProvider {
    static var previews: some View {
        ResultListHeader(results: [
                            true, false, true, false]
        )
        .previewLayout(.sizeThatFits)
    }
}
