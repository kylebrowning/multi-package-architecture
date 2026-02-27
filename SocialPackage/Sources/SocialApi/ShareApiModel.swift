import Toolkit

public struct ShareApiModel: ApiModel {
    public let id: Int
    public let landmarkId: Int
    public let userId: String
    public let message: String?
    public let createdAt: String
}
