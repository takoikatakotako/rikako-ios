import Foundation

enum InternalFileError: InternalError {
    case documentDirectoryNotFound
    var errorDescription: String? {
        switch self {
        case .documentDirectoryNotFound: return "ディレクトリーフォルダが見つかりませんでした"
        }
    }
}
