import SwiftUI

struct TopView: View {
    let questions: [Question] = [
        Question(questionId: 0, text: "電気を通すものはどれですか。", images: [], answer: 2, answers: ["消しゴム", "わりばし", "えんぴつのしん", "ふく"], comment: "えんぴつのしんは電気を通します。", commentImages: []),
        Question(questionId: 1, text: "方位じしんのN極はどちらを向きますか。", images: [], answer: 0, answers: ["北", "東", "南", "西"], comment: "方位じしんのN極は北を向きます。", commentImages: []),
        Question(questionId: 2, text: "アリの足は何本ですか。", images: [], answer: 1, answers: ["4", "6", "8", "10"], comment: "アリは昆虫なので6本の足があります", commentImages: []),
        Question(questionId: 3, text: "ジャガイモにヨウ素液をたらすと何色になりますか。", images: [], answer: 3, answers: ["黒色", "黄色", "赤色", "青紫色"], comment: "ジャガイモにはでんぷんが入っているためヨウ素液をたらすと青紫色になります。", commentImages: []),
        Question(questionId: 4, text: "植物が光合成をするとき、何をすって酸素を出しますか。", images: [], answer: 2, answers: ["ちっそ", "二酸化炭素", "水素", "酸素"], comment: "光合成は二酸化炭素をすって酸素を出します。", commentImages: []),
    ]
    
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: QuestionView(questinos: getRandomQuestions()),
                label: {
                    Text("問題画面へ")
                })
        }
    }
    
    func getRandomQuestions() -> [Question] {
        let shuffledQuestions = questions.shuffled()
        return Array(shuffledQuestions.prefix(3))
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
