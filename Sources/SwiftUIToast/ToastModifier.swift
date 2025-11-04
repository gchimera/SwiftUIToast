import SwiftUI

/// A view modifier that adds toast functionality to any SwiftUI view
public struct ToastModifier: ViewModifier {
    @ObservedObject private var toastManager = ToastManager.shared

    public init() {}

    public func body(content: Content) -> some View {
        ZStack {
            content
            if let toast = toastManager.currentToast {
                ToastView(
                    message: toast.message,
                    style: toast.style,
                    duration: toast.duration,
                    onDismiss: {
                        toastManager.dismiss()
                    }
                )
                .zIndex(1)
            }
        }
    }
}

extension View {
    /// Adds toast notification capability to the view
    /// - Returns: A view with toast functionality
    public func withToast() -> some View {
        self.modifier(ToastModifier())
    }
}