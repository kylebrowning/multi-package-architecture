import Foundation
import SwiftUI
import Toolkit
import LandmarksDomain
import ReservationsDomain
import SocialDomain

public struct ServiceEnvironment: Sendable {
    public let landmarkService: LandmarkService
    public let reservationService: ReservationService
    public let shareService: ShareService

    public init(
        landmarkService: LandmarkService,
        reservationService: ReservationService,
        shareService: ShareService
    ) {
        self.landmarkService = landmarkService
        self.reservationService = reservationService
        self.shareService = shareService
    }
}

extension ServiceEnvironment {
    public static func live(
        client: NetworkClient,
        baseURL: URL
    ) -> ServiceEnvironment {
        ServiceEnvironment(
            landmarkService: .live(client: client, baseURL: baseURL),
            reservationService: .live(client: client, baseURL: baseURL),
            shareService: .live(client: client, baseURL: baseURL)
        )
    }

    public static let mock = ServiceEnvironment(
        landmarkService: .mock,
        reservationService: .mock,
        shareService: .mock
    )

    public static let unimplemented = ServiceEnvironment(
        landmarkService: .unimplemented,
        reservationService: .unimplemented,
        shareService: .unimplemented
    )
}

struct ServiceEnvironmentModifier: ViewModifier {
    let environment: ServiceEnvironment

    func body(content: Content) -> some View {
        content
            .environment(\.landmarkService, environment.landmarkService)
            .environment(\.reservationService, environment.reservationService)
            .environment(\.shareService, environment.shareService)
    }
}

extension View {
    public func withServiceEnvironment(
        _ environment: ServiceEnvironment
    ) -> some View {
        modifier(ServiceEnvironmentModifier(environment: environment))
    }
}
