import Foundation

struct FileRepository {
    let categoriesDirectoryName = "categories"
    let questionsDirectoryName = "questions"
    let imagesDirectoryName = "images"
    let reviewsDirectoryName = "reviews"
    
    func initialize() throws {
        let categoriesDirectoryUrl = try getDocumentsDirectoryUrl().appendingPathComponent(categoriesDirectoryName)
        if !FileManager.default.fileExists(atPath: categoriesDirectoryUrl.path) {
            try FileManager.default.createDirectory(atPath: categoriesDirectoryUrl.path, withIntermediateDirectories: false, attributes: nil)
        }
        let questionsDirectoryUrl = try getDocumentsDirectoryUrl().appendingPathComponent(questionsDirectoryName, isDirectory: true)
        if !FileManager.default.fileExists(atPath: questionsDirectoryUrl.path) {
            try FileManager.default.createDirectory(atPath: questionsDirectoryUrl.path, withIntermediateDirectories: false, attributes: nil)
        }
        let imagesDirectoryUrl = try getDocumentsDirectoryUrl().appendingPathComponent(imagesDirectoryName, isDirectory: true)
        if !FileManager.default.fileExists(atPath: imagesDirectoryUrl.path) {
            try FileManager.default.createDirectory(atPath: imagesDirectoryUrl.path, withIntermediateDirectories: false, attributes: nil)
        }
        
        let reviewsDirectoryUrl = try getDocumentsDirectoryUrl().appendingPathComponent(reviewsDirectoryName, isDirectory: true)
        if !FileManager.default.fileExists(atPath: reviewsDirectoryUrl.path) {
            try FileManager.default.createDirectory(atPath: reviewsDirectoryUrl.path, withIntermediateDirectories: false, attributes: nil)
        }
    }
    
    func saveCategoryFile(category: Category) throws {
        let data = try JSONEncoder().encode(category)
        let fileUrl = try getDocumentsDirectoryUrl().appendingPathComponent(categoriesDirectoryName, isDirectory: true).appendingPathComponent(category.fileName)
        try data.write(to: fileUrl, options: .atomic)
    }
    
    func getCategoryFile(categoryId: Int) throws -> Category {
        let fileUrl = try getDocumentsDirectoryUrl().appendingPathComponent(categoriesDirectoryName, isDirectory: true).appendingPathComponent("\(categoryId).json")
        let data = try Data(contentsOf: fileUrl)
        let category = try JSONDecoder().decode(Category.self, from: data)
        return category
    }
    
    func saveQuestionFile(question: Question) throws {
        let data = try JSONEncoder().encode(question)
        let fileUrl = try getDocumentsDirectoryUrl().appendingPathComponent(questionsDirectoryName, isDirectory: true).appendingPathComponent(question.fileName)
        try data.write(to: fileUrl, options: .atomic)
    }
    
    func getQuestionFile(name: String) throws -> Question {
        let fileUrl = try getDocumentsDirectoryUrl().appendingPathComponent(questionsDirectoryName, isDirectory: true).appendingPathComponent(name)
        let data = try Data(contentsOf: fileUrl)
        let question = try JSONDecoder().decode(Question.self, from: data)
        return question
    }
    
    func saveImageFile(name: String, data: Data) throws {
        let fileUrl = try getDocumentsDirectoryUrl().appendingPathComponent(imagesDirectoryName, isDirectory: true).appendingPathComponent(name)
        try data.write(to: fileUrl, options: .atomic)
    }
    
    func getImageFile(name: String) throws -> Data {
        let fileUrl = try getDocumentsDirectoryUrl().appendingPathComponent(imagesDirectoryName, isDirectory: true).appendingPathComponent(name)
        let data = try Data(contentsOf: fileUrl)
        return data
    }
        
    func saveReviewFile(review: Review) throws {
        let data = try JSONEncoder().encode(review)
        let fileUrl = try getDocumentsDirectoryUrl().appendingPathComponent(reviewsDirectoryName, isDirectory: true).appendingPathComponent(Review.getFileName(categoryId: review.categoryId))
        try data.write(to: fileUrl, options: .atomic)
    }
    
    func getReviewFile(name: String) throws -> Review {
        let fileUrl = try getDocumentsDirectoryUrl().appendingPathComponent(reviewsDirectoryName, isDirectory: true).appendingPathComponent(name)
        let data = try Data(contentsOf: fileUrl)
        let review = try JSONDecoder().decode(Review.self, from: data)
        return review
    }
    
    private func getDocumentsDirectoryUrl() throws -> URL {
        guard let documentDirectoryUrl = FileManager.default.urls( for: .documentDirectory, in: .userDomainMask ).first else {
            throw InternalFileError.documentDirectoryNotFound
        }
        return documentDirectoryUrl
    }
}
