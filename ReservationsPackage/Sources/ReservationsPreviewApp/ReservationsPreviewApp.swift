import SwiftUI
import LandmarksDomain
import ReservationsDomain
import ReservationsFeature

@main
struct ReservationsPreviewApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ReservationListView()
            }
            .environment(\.reservationService, .mock)
            .environment(\.landmarkService, .mock)
        }
    }
}
