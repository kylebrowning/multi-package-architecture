import SwiftUI

public struct LoadingView: View {
    let message: String

    public init(_ message: String = "Loading...") {
        self.message = message
    }

    public var body: some View {
        ContentUnavailableView {
            ProgressView()
                .controlSize(.large)
        } description: {
            Text(message)
                .foregroundStyle(.secondary)
        }
    }
}

public struct ErrorView: View {
    let message: String
    let retry: (() -> Void)?

    public init(_ message: String, retry: (() -> Void)? = nil) {
        self.message = message
        self.retry = retry
    }

    public var body: some View {
        ContentUnavailableView {
            Image(systemName: "exclamationmark.triangle")
                .font(.largeTitle)
                .foregroundStyle(.secondary)
        } description: {
            Text(message)
                .foregroundStyle(.secondary)
        } actions: {
            if let retry {
                Button("Try Again", action: retry)
                    .buttonStyle(.primary)
                    .frame(width: 200)
            }
        }
    }
}

public struct EmptyStateView: View {
    let title: String
    let message: String
    let systemImage: String

    public init(
        title: String,
        message: String,
        systemImage: String = "tray"
    ) {
        self.title = title
        self.message = message
        self.systemImage = systemImage
    }

    public var body: some View {
        ContentUnavailableView {
            Label(title, systemImage: systemImage)
        } description: {
            Text(message)
        }
    }
}
