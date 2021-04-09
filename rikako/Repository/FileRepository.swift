import Foundation

struct FileRepository {

    func saveCategoryFile(category: Category) {
//        guard let data = try? JSONEncoder().encode(category) else {
//            throw NoteError.encodeNote
//        }
//        guard let compressedData: Data = data.zip() else {
//            throw FileHandlerError.compress
//        }
//        let fileUrl = try getDocumentsDirectoryUrl().appendingPathComponent(note.lectureFileName)
//        try compressedData.write(to: fileUrl, options: .atomic)
    }
    
    private func getDocumentsDirectoryUrl() throws -> URL {
        guard let documentDirectoryUrl = FileManager.default.urls( for: .documentDirectory, in: .userDomainMask ).first else {
            throw InternalFileError.documentDirectoryNotFound
        }
        return documentDirectoryUrl
    }
}
