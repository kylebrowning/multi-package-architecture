import Foundation
import SocialApi
import Toolkit

public struct ShareService: Sendable {
    public var fetchShares: @Sendable () async throws -> [Share]
    public var fetchSharesForLandmark: @Sendable (Int) async throws -> [Share]

    public init(
        fetchShares: @escaping @Sendable () async throws -> [Share],
        fetchSharesForLandmark: @escaping @Sendable (Int) async throws -> [Share]
    ) {
        self.fetchShares = fetchShares
        self.fetchSharesForLandmark = fetchSharesForLandmark
    }
}

// MARK: - Live

extension ShareService {
    public static func live(
        client: NetworkClient,
        baseURL: URL
    ) -> ShareService {
        ShareService(
            fetchShares: {
                let apiModels = try await client.get(
                    baseURL, ShareEndpoints.list()
                )
                return apiModels.compactMap(\.domainModel)
            },
            fetchSharesForLandmark: { landmarkId in
                let apiModels = try await client.get(
                    baseURL, ShareEndpoints.forLandmark(id: landmarkId)
                )
                return apiModels.compactMap(\.domainModel)
            }
        )
    }
}

// MARK: - Mock

extension ShareService {
    public static let mock = ShareService(
        fetchShares: {
            try? await Task.sleep(for: .milliseconds(200))
            return Share.mocks
        },
        fetchSharesForLandmark: { landmarkId in
            try? await Task.sleep(for: .milliseconds(150))
            return Share.mocks.filter { $0.landmarkId == landmarkId }
        }
    )

    public static let unimplemented = ShareService(
        fetchShares: { fatalError("fetchShares unimplemented") },
        fetchSharesForLandmark: { _ in fatalError("fetchSharesForLandmark unimplemented") }
    )
}
