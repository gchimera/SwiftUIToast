import SwiftUI

/// A customizable toast notification view for SwiftUI
public struct ToastView: View {
    public let message: String
    public let style: ToastStyle
    public let duration: TimeInterval
    public let onDismiss: () -> Void

    @State private var isPresented = false
    @State private var offset: CGFloat = -100

    public init(message: String, style: ToastStyle, duration: TimeInterval = 3.0, onDismiss: @escaping () -> Void) {
        self.message = message
        self.style = style
        self.duration = duration
        self.onDismiss = onDismiss
    }

    public var body: some View {
        VStack {
            Spacer()
            HStack {
                style.icon
                    .foregroundColor(.white)
                Text(message)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .medium))
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(style.backgroundColor)
            .cornerRadius(8)
            .shadow(radius: 4)
            .padding(.horizontal, 16)
            .offset(y: offset)
            .onAppear {
                withAnimation(.spring()) {
                    offset = 0
                    isPresented = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    dismissToast()
                }
            }
        }
        .transition(.move(edge: .top))
        .animation(.easeInOut, value: offset)
    }

    private func dismissToast() {
        withAnimation(.easeInOut) {
            offset = -100
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            isPresented = false
            onDismiss()
        }
    }
}

/// Defines the style and appearance of a toast
public struct ToastStyle {
    public let backgroundColor: Color
    public let icon: Image

    public static let success = ToastStyle(
        backgroundColor: Color.green,
        icon: Image(systemName: "checkmark.circle.fill")
    )

    public static let error = ToastStyle(
        backgroundColor: Color.red,
        icon: Image(systemName: "exclamationmark.triangle.fill")
    )

    public static let warning = ToastStyle(
        backgroundColor: Color.orange,
        icon: Image(systemName: "exclamationmark.circle.fill")
    )

    public static let info = ToastStyle(
        backgroundColor: Color.blue,
        icon: Image(systemName: "info.circle.fill")
    )
}