import Foundation
import Toolkit

public struct Share: DomainModel, Identifiable {
    public let id: Int
    public let landmarkId: Int
    public let userId: String
    public let message: String?
    public let createdAt: Date

    public init(
        id: Int,
        landmarkId: Int,
        userId: String,
        message: String?,
        createdAt: Date
    ) {
        self.id = id
        self.landmarkId = landmarkId
        self.userId = userId
        self.message = message
        self.createdAt = createdAt
    }
}
