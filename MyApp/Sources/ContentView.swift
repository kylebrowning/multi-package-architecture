import SwiftUI
import LandmarksFeature
import ReservationsFeature
import SocialFeature

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Landmarks", systemImage: "map") {
                NavigationStack {
                    LandmarkListView()
                }
            }

            Tab("Reservations", systemImage: "calendar") {
                NavigationStack {
                    ReservationListView()
                }
            }

            Tab("Activity", systemImage: "person.2") {
                NavigationStack {
                    ShareFeedView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .withServiceEnvironment(.mock)
}
