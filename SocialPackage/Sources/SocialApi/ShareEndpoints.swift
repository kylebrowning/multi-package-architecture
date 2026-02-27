import Foundation
import Toolkit

public enum ShareEndpoints {
    public static func list() -> Endpoint<EmptyBody, [ShareApiModel]> {
        Endpoint(path: "/api/shares", method: .get)
    }

    public static func forLandmark(
        id: Int
    ) -> Endpoint<EmptyBody, [ShareApiModel]> {
        Endpoint(
            path: "/api/shares",
            method: .get,
            queryItems: [URLQueryItem(name: "landmarkId", value: "\(id)")]
        )
    }
}
