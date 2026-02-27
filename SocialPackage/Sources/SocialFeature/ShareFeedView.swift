import SwiftUI
import SocialDomain
import LandmarksDomain
import DesignSystem

public struct ShareFeedView: View {
    @Environment(\.shareService) private var shareService
    @Environment(\.landmarkService) private var landmarkService
    @State private var shares: [Share] = []
    @State private var landmarks: [Int: Landmark] = [:]
    @State private var isLoading = true
    @State private var error: Error?

    public init() {}

    public var body: some View {
        Group {
            if isLoading {
                LoadingView("Loading activity...")
            } else if let error {
                ErrorView(error.localizedDescription) {
                    Task { await load() }
                }
            } else if shares.isEmpty {
                EmptyStateView(
                    title: "No Activity",
                    message: "Share a landmark to see it here.",
                    systemImage: "person.2"
                )
            } else {
                List(shares) { share in
                    ShareRow(
                        share: share,
                        landmarkName: landmarks[share.landmarkId]?.name
                    )
                }
            }
        }
        .navigationTitle("Activity")
        .task { await load() }
    }

    private func load() async {
        isLoading = true
        error = nil
        do {
            shares = try await shareService.fetchShares()
            let allLandmarks = try await landmarkService.fetchLandmarks()
            landmarks = Dictionary(
                uniqueKeysWithValues: allLandmarks.map { ($0.id, $0) }
            )
        } catch {
            self.error = error
        }
        isLoading = false
    }
}

struct ShareRow: View {
    let share: Share
    let landmarkName: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(landmarkName ?? "Unknown Landmark")
                .font(.headline)
            if let message = share.message {
                Text(message)
                    .font(.subheadline)
            }
            Text(share.createdAt.formatted(date: .abbreviated, time: .shortened))
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    NavigationStack {
        ShareFeedView()
    }
    .environment(\.shareService, .mock)
    .environment(\.landmarkService, .mock)
}
