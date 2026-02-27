import SwiftUI
import LandmarksDomain
import DesignSystem

public struct LandmarkListView: View {
    @Environment(\.landmarkService) private var service
    @State private var landmarks: [Landmark] = []
    @State private var isLoading = true
    @State private var error: Error?

    public init() {}

    public var body: some View {
        Group {
            if isLoading {
                LoadingView("Loading landmarks...")
            } else if let error {
                ErrorView(error.localizedDescription) {
                    Task { await load() }
                }
            } else if landmarks.isEmpty {
                EmptyStateView(
                    title: "No Landmarks",
                    message: "Check back later for new landmarks to explore.",
                    systemImage: "map"
                )
            } else {
                List(landmarks) { landmark in
                    NavigationLink(value: landmark) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
        .navigationTitle("Landmarks")
        .task { await load() }
    }

    private func load() async {
        isLoading = true
        error = nil
        do {
            landmarks = try await service.fetchLandmarks()
        } catch {
            self.error = error
        }
        isLoading = false
    }
}

struct LandmarkRow: View {
    let landmark: Landmark

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.headline)
                Text(landmark.park)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview {
    NavigationStack {
        LandmarkListView()
    }
    .environment(\.landmarkService, .mock)
}
