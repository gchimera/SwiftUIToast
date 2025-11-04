# SwiftUIToast

A beautiful, customizable toast notification library for SwiftUI iOS applications. Perfect for providing user feedback, success messages, warnings, and errors in a non-intrusive way.
<br>
<p align="left">
  <img src="https://github.com/gchimera/chimeradev.app/blob/main/Simulator14.27.49.gif" width="300" height="1000" alt="Anteprima App" />
</p>

## Features

- 🍎 Native SwiftUI implementation
- 🎨 Customizable styles (success, error, warning, info)
- ⏱️ Configurable duration
- 📱 iOS 14+ support
- 🔧 Easy to integrate with Swift Package Manager
- 🎯 Simple API for showing toasts from anywhere in your app

## Installation

Add SwiftUIToast to your project using Swift Package Manager:

1. In Xcode, select **File > Add Packages...**
2. Enter the package URL: `https://github.com/gchimera/SwiftUIToast.git`
3. Select the version you want to use

Or add it directly to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/gchimera/SwiftUIToast.git", from: "1.0.0")
]
```

## Usage

### Basic Setup

First, add the toast modifier to your main view:

```swift
import SwiftUI
import SwiftUIToast

@main
struct YourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .withToast() // Add this modifier
        }
    }
}
```

### Showing Toasts

You can show toasts from anywhere in your app using the shared manager:

```swift
import SwiftUIToast

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Show Success Toast") {
                ToastManager.shared.show(
                    message: "Operation completed successfully!",
                    style: .success
                )
            }

            Button("Show Error Toast") {
                ToastManager.shared.show(
                    message: "Something went wrong",
                    style: .error,
                    duration: 5.0
                )
            }

            Button("Show Warning Toast") {
                ToastManager.shared.show(
                    message: "Please check your input",
                    style: .warning
                )
            }

            Button("Show Info Toast") {
                ToastManager.shared.show(
                    message: "Here's some information",
                    style: .info
                )
            }
        }
    }
}
```

### Custom Styling

You can create custom toast styles:

```swift
let customStyle = ToastStyle(
    backgroundColor: Color.purple,
    icon: Image(systemName: "star.fill")
)

ToastManager.shared.show(
    message: "Custom styled toast!",
    style: customStyle
)
```

## API Reference

### ToastManager

The main class for managing toast notifications.

- `shared: ToastManager` - Singleton instance
- `show(message: String, style: ToastStyle, duration: TimeInterval)` - Shows a toast
- `dismiss()` - Dismisses the current toast

### ToastStyle

Predefined styles available:
- `.success` - Green background with checkmark
- `.error` - Red background with warning triangle
- `.warning` - Orange background with exclamation mark
- `.info` - Blue background with info icon

### View Extensions

- `.withToast()` - Modifier to enable toast functionality

## Example Project

Check out the included example project to see SwiftUIToast in action.

## Requirements

- iOS 14.0+
- Swift 5.5+
- Xcode 13+

## License

SwiftUIToast is available under the MIT license. See the LICENSE file for more info.

## Contributing

Pull requests are welcome! Please feel free to submit a Pull Request.
