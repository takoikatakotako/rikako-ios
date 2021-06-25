import Foundation

struct FileRepository {
    let categoriesDirectoryName = "categories"
    let questionsDirectoryName = "questions"
    let imagesDirectoryName = "images"
    let configDirectoryName = "config"

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
        let configDirectoryUrl = try getDocumentsDirectoryUrl().appendingPathComponent(configDirectoryName, isDirectory: true)
        if !FileManager.default.fileExists(atPath: configDirectoryUrl.path) {
            try FileManager.default.createDirectory(atPath: configDirectoryUrl.path, withIntermediateDirectories: false, attributes: nil)
        }
        
        let configFileUrl = try getDocumentsDirectoryUrl().appendingPathComponent(configDirectoryName, isDirectory: true).appendingPathComponent(Config.fileName)
        if !FileManager.default.fileExists(atPath: configFileUrl.path) {
            let data = try JSONEncoder().encode(Config(questionNumber: 5))
            try data.write(to: configFileUrl, options: .atomic)
        }
    }

    func saveCategoryFile(category: Category) throws {
        let data = try JSONEncoder().encode(category)
        let fileUrl = try getDocumentsDirectoryUrl().appendingPathComponent(categoriesDirectoryName, isDirectory: true).appendingPathComponent(category.fileName)
        try data.write(to: fileUrl, options: .atomic)
    }
    
    func readCategoryFile(categoryId: Int) throws -> Category {
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
    
    func saveImageFile(name: String, data: Data) throws {
        let fileUrl = try getDocumentsDirectoryUrl().appendingPathComponent(imagesDirectoryName, isDirectory: true).appendingPathComponent(name)
        try data.write(to: fileUrl, options: .atomic)
    }
    
    func saveConfigFile(config: Config) throws {
        let data = try JSONEncoder().encode(config)
        let fileUrl = try getDocumentsDirectoryUrl().appendingPathComponent(configDirectoryName, isDirectory: true).appendingPathComponent(Config.fileName)
        try data.write(to: fileUrl, options: .atomic)
    }
    
    func readConfigFile() throws -> Config {
        let fileUrl = try getDocumentsDirectoryUrl().appendingPathComponent(configDirectoryName, isDirectory: true).appendingPathComponent(Config.fileName)
        let data = try Data(contentsOf: fileUrl)
        let config = try JSONDecoder().decode(Config.self, from: data)
        return config
    }
    
    private func getDocumentsDirectoryUrl() throws -> URL {
        guard let documentDirectoryUrl = FileManager.default.urls( for: .documentDirectory, in: .userDomainMask ).first else {
            throw InternalFileError.documentDirectoryNotFound
        }
        return documentDirectoryUrl
    }
}
