import Foundation

enum PublicCommonError: PublicError {
    case unknown
    var errorDescription: String? {
        switch self {
        case .unknown: return "不明なエラーです"
        }
    }
}
