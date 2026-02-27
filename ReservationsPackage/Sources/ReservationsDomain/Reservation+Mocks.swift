import Foundation

extension Reservation {
    public static let mocks: [Reservation] = [
        Reservation(
            id: 1,
            landmarkId: 1001,
            startDate: Calendar.current.date(byAdding: .day, value: 7, to: .now)!,
            endDate: Calendar.current.date(byAdding: .day, value: 10, to: .now)!,
            status: .confirmed,
            guestCount: 2,
            notes: "Anniversary trip"
        ),
        Reservation(
            id: 2,
            landmarkId: 1002,
            startDate: Calendar.current.date(byAdding: .day, value: 14, to: .now)!,
            endDate: Calendar.current.date(byAdding: .day, value: 17, to: .now)!,
            status: .pending,
            guestCount: 4,
            notes: nil
        ),
        Reservation(
            id: 3,
            landmarkId: 1003,
            startDate: Calendar.current.date(byAdding: .day, value: -5, to: .now)!,
            endDate: Calendar.current.date(byAdding: .day, value: -2, to: .now)!,
            status: .cancelled,
            guestCount: 1,
            notes: "Weather cancellation"
        ),
    ]
}
