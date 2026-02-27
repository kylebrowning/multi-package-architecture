import SwiftUI
import ReservationsDomain
import LandmarksDomain
import DesignSystem

public struct ReservationListView: View {
    @Environment(\.reservationService) private var reservationService
    @Environment(\.landmarkService) private var landmarkService
    @State private var reservations: [Reservation] = []
    @State private var landmarks: [Int: Landmark] = [:]
    @State private var isLoading = true
    @State private var error: Error?

    public init() {}

    public var body: some View {
        Group {
            if isLoading {
                LoadingView("Loading reservations...")
            } else if let error {
                ErrorView(error.localizedDescription) {
                    Task { await load() }
                }
            } else if reservations.isEmpty {
                EmptyStateView(
                    title: "No Reservations",
                    message: "Book a campsite at one of our landmarks.",
                    systemImage: "calendar"
                )
            } else {
                List(reservations) { reservation in
                    ReservationRow(
                        reservation: reservation,
                        landmarkName: landmarks[reservation.landmarkId]?.name
                    )
                }
            }
        }
        .navigationTitle("Reservations")
        .task { await load() }
    }

    private func load() async {
        isLoading = true
        error = nil
        do {
            reservations = try await reservationService.fetchReservations()
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

struct ReservationRow: View {
    let reservation: Reservation
    let landmarkName: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(landmarkName ?? "Unknown Landmark")
                .font(.headline)
            Text(reservation.startDate.formatted(date: .abbreviated, time: .omitted))
                .font(.subheadline)
                .foregroundStyle(.secondary)
            StatusBadge(
                reservation.status.rawValue.capitalized,
                color: statusColor
            )
        }
    }

    private var statusColor: Color {
        switch reservation.status {
        case .confirmed: .green
        case .pending: .orange
        case .cancelled: .red
        }
    }
}

#Preview {
    NavigationStack {
        ReservationListView()
    }
    .environment(\.reservationService, .mock)
    .environment(\.landmarkService, .mock)
}
