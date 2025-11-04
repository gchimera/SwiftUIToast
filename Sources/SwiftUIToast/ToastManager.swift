import SwiftUI
import Combine

/// Manages toast notifications globally
public class ToastManager: ObservableObject {
    public static let shared = ToastManager()

    @Published public var currentToast: Toast?

    private var cancellables = Set<AnyCancellable>()

    private init() {}

    /// Shows a toast notification
    /// - Parameters:
    ///   - message: The message to display
    ///   - style: The style of the toast
    ///   - duration: How long the toast should be visible (default: 3 seconds)
    public func show(message: String, style: ToastStyle, duration: TimeInterval = 3.0) {
        let toast = Toast(message: message, style: style, duration: duration)
        currentToast = toast

        // Auto-dismiss after duration
        Just(())
            .delay(for: .seconds(duration), scheduler: RunLoop.main)
            .sink { [weak self] _ in
                self?.dismiss()
            }
            .store(in: &cancellables)
    }

    /// Dismisses the current toast
    public func dismiss() {
        currentToast = nil
    }
}

/// Represents a toast notification
public struct Toast: Identifiable {
    public let id = UUID()
    public let message: String
    public let style: ToastStyle
    public let duration: TimeInterval
}