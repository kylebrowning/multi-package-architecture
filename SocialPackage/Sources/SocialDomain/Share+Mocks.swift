import Foundation

extension Share {
    public static let mocks: [Share] = [
        Share(
            id: 1,
            landmarkId: 1001,
            userId: "user-1",
            message: "Amazing rock formations at Joshua Tree!",
            createdAt: Calendar.current.date(byAdding: .day, value: -2, to: .now)!
        ),
        Share(
            id: 2,
            landmarkId: 1002,
            userId: "user-2",
            message: "The salmon run was incredible this year.",
            createdAt: Calendar.current.date(byAdding: .day, value: -5, to: .now)!
        ),
        Share(
            id: 3,
            landmarkId: 1004,
            userId: "user-1",
            message: nil,
            createdAt: Calendar.current.date(byAdding: .hour, value: -3, to: .now)!
        ),
    ]
}
