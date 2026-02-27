import Foundation
import SocialApi

extension ShareApiModel {
    public var domainModel: Share? {
        let formatter = ISO8601DateFormatter()
        guard let date = formatter.date(from: createdAt) else {
            return nil
        }
        return Share(
            id: id,
            landmarkId: landmarkId,
            userId: userId,
            message: message,
            createdAt: date
        )
    }
}
