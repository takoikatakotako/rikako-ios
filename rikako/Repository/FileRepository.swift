import Foundation

struct FileRepository {

    func saveCategoryFile(category: Category) throws {
        let data = try JSONEncoder().encode(category)
        let fileUrl = try getDocumentsDirectoryUrl().appendingPathComponent(category.fileName)
        try data.write(to: fileUrl, options: .atomic)
    }
    
    private func getDocumentsDirectoryUrl() throws -> URL {
        guard let documentDirectoryUrl = FileManager.default.urls( for: .documentDirectory, in: .userDomainMask ).first else {
            throw InternalFileError.documentDirectoryNotFound
        }
        return documentDirectoryUrl
    }
}
