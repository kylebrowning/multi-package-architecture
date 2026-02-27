import SwiftUI
import LandmarksDomain
import LandmarksFeature
import ReservationsDomain
import ReservationsFeature
import SocialDomain
import SocialFeature
import Toolkit

@main
struct MyApp: App {
    let services: ServiceEnvironment = .live(
        client: .default,
        baseURL: URL(string: "https://api.example.com")!
    )

    var body: some Scene {
        WindowGroup {
            ContentView()
                .withServiceEnvironment(services)
        }
    }
}
