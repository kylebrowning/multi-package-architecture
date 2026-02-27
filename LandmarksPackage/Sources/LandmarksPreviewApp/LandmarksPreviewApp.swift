import SwiftUI
import LandmarksDomain
import LandmarksFeature

@main
struct LandmarksPreviewApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                LandmarkListView()
            }
            .environment(\.landmarkService, .mock)
        }
    }
}
