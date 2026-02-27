import Foundation

public enum ShareError: Error, LocalizedError {
    case notFound
    case invalidData
    case networkError(Error)

    public var errorDescription: String? {
        switch self {
        case .notFound:
            return "Share not found."
        case .invalidData:
            return "The share data was invalid."
        case .networkError(let error):
            return error.localizedDescription
        }
    }
}
