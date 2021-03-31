import SwiftUI

struct TopView: View {
    let questions: [Question] = [
        Question(questionId: 0, text: "電気を通すものはどれですか。", images: [], answer: 2, answers: ["消しゴム", "わりばし", "えんぴつのしん", "ふく"], comment: "えんぴつのしんは電気を通します。", commentImages: []),
        Question(questionId: 1, text: "方位じしんのN極はどちらを向きますか。", images: [], answer: 0, answers: ["北", "東", "南", "西"], comment: "方位じしんのN極は北を向きます。", commentImages: []),
        Question(questionId: 2, text: "アリの足は何本ですか。", images: [], answer: 1, answers: ["4", "6", "8", "10"], comment: "アリは昆虫なので6本の足があります", commentImages: []),
        Question(questionId: 3, text: "ジャガイモにヨウ素液をたらすと何色になりますか。", images: [], answer: 3, answers: ["黒色", "黄色", "赤色", "青紫色"], comment: "ジャガイモにはでんぷんが入っているためヨウ素液をたらすと青紫色になります。", commentImages: []),
        Question(questionId: 4, text: "植物が光合成をするとき、何をすって酸素を出しますか。", images: [], answer: 2, answers: ["ちっそ", "二酸化炭素", "水素", "酸素"], comment: "光合成は二酸化炭素をすって酸素を出します。", commentImages: []),
    ]
    
    @State var showingQuestionSheet = false
    
    var body: some View {
        TabView {
            ZStack {
                Color("main")
                    .ignoresSafeArea(edges: .all)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color.red)
                
                VStack {
                    Spacer()
                    Image("top-app-logo")
                    Image("top-rikako-standing")
                    Spacer()
                    HStack {
                        Text("高校受験化学")
                        Spacer()
                        Text("達成率2.3%")
                    }
                    
                    HStack {
                        Button(action: {
                            showingQuestionSheet = true
                        }, label: {
                            Text("xxx")
                        })
                        
                        Button(action: {
                            showingQuestionSheet = true
                        }, label: {
                            Text("xxx")
                        })
                    }
                    
                }
            }
            .tabItem {
                Image(systemName: "1.square.fill")
                Text("First")
            }
            CategoryView()
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
            ConfigView()
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
                }
        }
        .background(Color.red)
        .fullScreenCover(isPresented: $showingQuestionSheet){
            NavigationView {
                QuestionView(questinos: getRandomQuestions(), showingSheet: $showingQuestionSheet)
            }
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
