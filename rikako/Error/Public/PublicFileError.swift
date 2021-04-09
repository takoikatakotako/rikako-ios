import Foundation

enum PublicFileError: PublicError {
    case failToSaveCategory
    var errorDescription: String? {
        switch self {
        case .failToSaveCategory: return "カテゴリーの保存に失敗しました"
        }
    }
}
