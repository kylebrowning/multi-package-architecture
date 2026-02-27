import SwiftUI

public struct AppTheme: Sendable {
    public let cornerRadius: CGFloat
    public let cardPadding: CGFloat
    public let sectionSpacing: CGFloat

    public init(
        cornerRadius: CGFloat = 12,
        cardPadding: CGFloat = 16,
        sectionSpacing: CGFloat = 24
    ) {
        self.cornerRadius = cornerRadius
        self.cardPadding = cardPadding
        self.sectionSpacing = sectionSpacing
    }

    public static let `default` = AppTheme()
}

extension EnvironmentValues {
    @Entry public var appTheme: AppTheme = .default
}
