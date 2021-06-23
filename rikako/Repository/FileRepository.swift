import Foundation

struct FileRepository {
    
    func createDirectories() throws {
        let categoriesDirectoryUrl = try getDocumentsDirectoryUrl().appendingPathComponent("categories")
        if !FileManager.default.fileExists(atPath: categoriesDirectoryUrl.path) {
            try FileManager.default.createDirectory(atPath: categoriesDirectoryUrl.path, withIntermediateDirectories: false, attributes: nil)
        }

        let questionsDirectoryUrl = try getDocumentsDirectoryUrl().appendingPathComponent("questions", isDirectory: true)
        if !FileManager.default.fileExists(atPath: questionsDirectoryUrl.path) {
            try FileManager.default.createDirectory(atPath: questionsDirectoryUrl.path, withIntermediateDirectories: false, attributes: nil)
        }

        let imagesDirectoryUrl = try getDocumentsDirectoryUrl().appendingPathComponent("images", isDirectory: true)
        if !FileManager.default.fileExists(atPath: imagesDirectoryUrl.path) {
            try FileManager.default.createDirectory(atPath: imagesDirectoryUrl.path, withIntermediateDirectories: false, attributes: nil)
        }
    }

    func saveCategoryFile(category: Category) throws {
        let data = try JSONEncoder().encode(category)
        let fileUrl = try getDocumentsDirectoryUrl().appendingPathComponent(category.fileName)
        try data.write(to: fileUrl, options: .atomic)
    }
    
    func saveQuestionFile(question: Question) throws {
        let data = try JSONEncoder().encode(question)
        let fileUrl = try getDocumentsDirectoryUrl().appendingPathComponent("questions", isDirectory: true).appendingPathComponent(question.fileName)
        try data.write(to: fileUrl, options: .atomic)
    }
    
    func saveImageFile(name: String, data: Data) throws {
        let fileUrl = try getDocumentsDirectoryUrl().appendingPathComponent("images", isDirectory: true).appendingPathComponent(name)
        try data.write(to: fileUrl, options: .atomic)
    }
    
    private func getDocumentsDirectoryUrl() throws -> URL {
        guard let documentDirectoryUrl = FileManager.default.urls( for: .documentDirectory, in: .userDomainMask ).first else {
            throw InternalFileError.documentDirectoryNotFound
        }
        return documentDirectoryUrl
    }
}
